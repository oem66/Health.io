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
    func HealthStoreAvailability()
    func FetchDataFromHealthStore()
    func FetchActivityData()
    func FetchHealthData()
}

class HealthService: HealthServiceProtocol {
    static let shared = HealthService()
    private var healthStore = HKHealthStore()
    
    var steps = 0
    var heartRate = 0
    var calories = 0
    var sleep = 0.0
    
    private init() { }
    
    func HealthStoreAvailability() {
        if HKHealthStore.isHealthDataAvailable() {
            let readTypes = Set([
                HKObjectType.quantityType(forIdentifier: .heartRate)!,
                HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                HKObjectType.quantityType(forIdentifier: .stepCount)!,
                HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
            ])
            
            healthStore.requestAuthorization(toShare: nil, read: readTypes) { status, error in
                if status {
                    self.FetchDataFromHealthStore()
                } else {
                    debugPrint("Health Store Error: \(error)")
                }
            }
        }
    }
    
    func FetchDataFromHealthStore() {
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
                // process each sample here
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

    /*Method to get todays heart rate - this only reads data from health kit. */
    func FetchHeartRate() {
        //predicate
        let calendar = NSCalendar.current
        let now = NSDate()
        let components = calendar.dateComponents([.year, .month, .day], from: now as Date)
        
        guard let startDate:NSDate = calendar.date(from: components) as NSDate? else { return }
        var dayComponent    = DateComponents()
        dayComponent.day    = 1
        let endDate:NSDate? = calendar.date(byAdding: dayComponent, to: startDate as Date) as NSDate?
        let predicate = HKQuery.predicateForSamples(withStart: startDate as Date, end: endDate as Date?, options: [])

        //descriptor
        let sortDescriptors = [
                                NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
                              ]
        
        heartRateQuery = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: 2, sortDescriptors: sortDescriptors, resultsHandler: { (query, results, error) in
            guard error == nil else { print("error"); return }

            self.printHeartRateInfo(results: results) { heartRate in
                debugPrint("HR1: \(heartRate)")
                self.heartRate = heartRate
            }
        }) //eo-query
        
        healthStore.execute(heartRateQuery!)
     }//eom
    
    /*used only for testing, prints heart rate info */
    private func printHeartRateInfo(results:[HKSample]?, completion: @escaping (Int)->())
    {
        for (_, sample) in results!.enumerated() {
            guard let currData:HKQuantitySample = sample as? HKQuantitySample else { return }
            
//            self.heartRate = Int(currData.quantity.doubleValue(for: heartRateUnit))
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
    
    func FetchActivityData() {
        guard let sampleType = HKCategoryType.quantityType(forIdentifier: .stepCount) else { return }
//        guard let walkingRunning = HKCategoryType.quantityType(forIdentifier: .distanceWalkingRunning) else { return }
        
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
    
    private func queryData(quantityType: HKQuantityType) {
        let startDate = Calendar.current.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
        var interval = DateComponents()
        interval.day = 1
        
        let query = HKStatisticsCollectionQuery(quantityType: quantityType, quantitySamplePredicate: predicate, options: [.cumulativeSum], anchorDate: startDate, intervalComponents: interval)
        query.initialResultsHandler = { query, result, error in
            if let myResult = result {
                myResult.enumerateStatistics(from: startDate, to: Date()) { (statistics, value) in
                    if let count = statistics.sumQuantity() {
                        let val = count.doubleValue(for: HKUnit.count())
//                        self.flightsClmb = Int(val)
                        print("Walking running distance \(val) meters")
                    }
                }
            }
        }
    }
    
    func FetchHealthData() {
        defer { debugPrint("DATA: \(heartRate), \(steps)") }
        FetchActivityData()
        FetchHeartRate()
    }
    
    func getData() -> [Int] {
        debugPrint("DATA2: \(heartRate), \(steps), \(calories)")
        let data = [heartRate, steps, calories]
        return data
    }
}
