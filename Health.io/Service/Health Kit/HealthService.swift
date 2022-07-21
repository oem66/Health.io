//
//  HealthService.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/15/22.
//

import Foundation
import HealthKit
import SwiftUI

protocol HealthServiceProtocol {
    func healthStoreAvailability()
    func fetchDataFromHealthStore()
    func fetchActivityData()
    func fetchHealthData()
}

class HealthService: HealthServiceProtocol {
    
    static let shared = HealthService()
    private var healthStore = HKHealthStore()
    
    var steps = 0
    var heartRate = 0
    var calories = 0
    var sleep = 0.0
    
    private init() { }
    
    func healthStoreAvailability() {
        if HKHealthStore.isHealthDataAvailable() {
            let readTypes = Set([
                HKObjectType.quantityType(forIdentifier: .heartRate)!,
                HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                HKObjectType.quantityType(forIdentifier: .stepCount)!,
                HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
            ])
            
            healthStore.requestAuthorization(toShare: nil, read: readTypes) { status, error in
                if status {
                    self.fetchDataFromHealthStore()
                } else {
                    debugPrint("Health Store Error: \(error?.localizedDescription)")
                }
            }
        }
    }
    
    func fetchDataFromHealthStore() {
        let calendar = NSCalendar.current
        let now = Date()
        let components = calendar.dateComponents([.year, .month, .day], from: now)
        
        guard let startDate = calendar.date(from: components) else { fatalError("*** Unable to create the start date ***") }
        guard let endDate = calendar.date(byAdding: .day, value: 1, to: startDate) else { fatalError("*** Unable to create the end date ***") }
        
        let today = HKQuery.predicateForSamples(withStart: startDate, end: endDate, options: [])
        let sortByDate = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: true)
        guard let sampleType = HKSampleType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) else {
            fatalError("*** This method should never fail ***")
        }
        
        let query = HKSampleQuery(sampleType: sampleType, predicate: today, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortByDate]) { (query, results, error) in
            guard let samples = results as? [HKQuantitySample] else {
                // handle errors here
                return
            }
            
            for sample in samples {
                print("Heart rate -> \(sample)")
            }
            
            // The results come back on an anonymous background queue.
            // Dispatch to the main queue before modifying the UI.
            
            DispatchQueue.main.async {
                // Update UI here
            }
            
            self.healthStore.execute(query)
        }
    }
    
    let heartRateUnit:HKUnit = HKUnit(from: "count/min")
    let heartRateType:HKQuantityType = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!
    var heartRateQuery:HKSampleQuery?

    func fetchHeartRate() {
        let calendar = NSCalendar.current
        let now = NSDate()
        let components = calendar.dateComponents([.year, .month, .day], from: now as Date)
        
        guard let startDate:NSDate = calendar.date(from: components) as NSDate? else { return }
        var dayComponent    = DateComponents()
        dayComponent.day    = 1
        let endDate:NSDate? = calendar.date(byAdding: dayComponent, to: startDate as Date) as NSDate?
        let predicate = HKQuery.predicateForSamples(withStart: startDate as Date, end: endDate as Date?, options: [])

        let sortDescriptors = [
                                NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
                              ]
        
        heartRateQuery = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: 2, sortDescriptors: sortDescriptors, resultsHandler: { (query, results, error) in
            guard error == nil else { print("error"); return }

            self.printHeartRateInfo(results: results) { heartRate in
                debugPrint("HR1: \(heartRate)")
                self.heartRate = heartRate
            }
        })
        
        healthStore.execute(heartRateQuery!)
     }
    
    private func printHeartRateInfo(results:[HKSample]?, completion: @escaping (Int)->())
    {
        for (_, sample) in results!.enumerated() {
            guard let currData:HKQuantitySample = sample as? HKQuantitySample else { return }
            completion(Int(currData.quantity.doubleValue(for: heartRateUnit)))
            debugPrint("HR: \(Int(currData.quantity.doubleValue(for: heartRateUnit)))")
            
            debugPrint("[\(sample)]")
            debugPrint("Heart Rate: \(Int(currData.quantity.doubleValue(for: heartRateUnit)))")
            debugPrint("quantityType: \(currData.quantityType)")
            debugPrint("Start Date: \(currData.startDate)")
            debugPrint("End Date: \(currData.endDate)")
            debugPrint("Metadata: \(currData.metadata)")
            debugPrint("UUID: \(currData.uuid)")
            debugPrint("Source: \(currData.sourceRevision)")
            debugPrint("Device: \(currData.device)")
            debugPrint("---------------------------------\n")
        }
    }
    
    func fetchActivityData() {
        guard let sampleType = HKCategoryType.quantityType(forIdentifier: .stepCount) else { return }
        
        let startDate = Calendar.current.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
        var interval = DateComponents()
        interval.day = 1
        
        let querySteps = HKStatisticsCollectionQuery(quantityType: sampleType, quantitySamplePredicate: predicate, options: [.cumulativeSum], anchorDate: startDate, intervalComponents: interval)
        querySteps.initialResultsHandler = { query, result, error in
            if let myResult = result {
                myResult.enumerateStatistics(from: startDate, to: Date()) { (statistics, value) in
                    if let count = statistics.sumQuantity() {
                        let val = count.doubleValue(for: HKUnit.count())
                        self.steps = Int(val)
                        debugPrint("Steps: \(Int(val)) steps")
                    }
                }
            }
        }
        
        let queries: [HKStatisticsCollectionQuery] = [querySteps]
        for query in queries {
            healthStore.execute(query)
        }
    }
    
    func fetchSleepAnalysis() {
        if let sleepType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis) {
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            let query = HKSampleQuery(sampleType: sleepType, predicate: nil, limit: 30, sortDescriptors: [sortDescriptor]) { (query, tmpResult, error) -> Void in
                
                if error != nil { return }
                
                if let result = tmpResult {
                    for item in result {
                        if let sample = item as? HKCategorySample {
                            let value = (sample.value == HKCategoryValueSleepAnalysis.inBed.rawValue) ? "InBed" : "Asleep"
                            print("Healthkit sleep:\(sample.startDate)\(sample.endDate) - value:\(value)")
                        }
                    }
                }
            }
            healthStore.execute(query)
        }
    }
    
    func fetchActiveEnergy() {
        guard let energyType = HKSampleType.quantityType(forIdentifier: .activeEnergyBurned) else {
            debugPrint("Sample type not available")
            return
        }
        
        var dayBefore: Date { return Calendar.current.date(byAdding: .day, value: -1, to: Date())! }
        let last24hPredicate = HKQuery.predicateForSamples(withStart: dayBefore, end: Date(), options: .strictEndDate)
        
        let activeEnergy = HKSampleQuery(sampleType: energyType,
                                        predicate: last24hPredicate,
                                        limit: HKObjectQueryNoLimit,
                                        sortDescriptors: nil) { (query, sample, error) in
            guard error == nil, let quantitySamples = sample as? [HKQuantitySample] else {
                debugPrint("Something went wrong: \(error)")
                return
            }
            
            let total = quantitySamples.reduce(0.0) { $0 + $1.quantity.doubleValue(for: HKUnit.kilocalorie()) }
            print("Active Energy: \(total)")
            self.calories = Int(total)
            DispatchQueue.main.async {
//                self.energyLabel.text = String(format: "Energy: %.2f", total)
            }
        }
        HKHealthStore().execute(activeEnergy)
    }
    
    func fetchHealthData() {
        defer { debugPrint("DATA: \(heartRate), \(steps)") }
        fetchActivityData()
        fetchHeartRate()
        fetchSleepAnalysis()
        fetchActiveEnergy()
    }
    
    func getData() -> [Int] {
        debugPrint("DATA2: \(heartRate), \(steps), \(calories)")
        let data = [heartRate, steps, calories]
        return data
    }
}
