//
//  HealthService.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/15/22.
//

import Foundation
import HealthKit
import SwiftUI

enum Section {
    case healthRecords
    case fitnessData
    
    var displayName: String {
        switch self {
        case .healthRecords:
            return "Health Records"
        case .fitnessData:
            return "Fitness Data"
        }
        
        var types: [HKSampleType] {
            switch self {
            case .healthRecords:
                return [
                    HKObjectType.clinicalType(forIdentifier: .allergyRecord)!,
                    HKObjectType.clinicalType(forIdentifier: .vitalSignRecord)!,
                    HKObjectType.clinicalType(forIdentifier: .conditionRecord)!,
                    HKObjectType.clinicalType(forIdentifier: .immunizationRecord)!,
                    HKObjectType.clinicalType(forIdentifier: .labResultRecord)!,
                    HKObjectType.clinicalType(forIdentifier: .medicationRecord)!,
                    HKObjectType.clinicalType(forIdentifier: .procedureRecord)!
                ]
            case .fitnessData:
                return [
                    HKObjectType.quantityType(forIdentifier: .stepCount)!,
                    HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
                    HKObjectType.quantityType(forIdentifier: .oxygenSaturation)!
                ]
            }
        }
    }
}

protocol HealthServiceProtocol {
    func HealthStoreAvailability()
    func FetchDataFromHealthStore()
    func FetchActivityData()
    func GetMostRecentSample(for sampleType: HKSampleType, completion: @escaping (HKQuantitySample?, Error?) -> ())
    func FetchBodyMeasurements()
    func FetchHealthData()
}

class HealthService: HealthServiceProtocol {
    
    private var healthStore = HKHealthStore()
    
    var heartRate = Int()
    var steps = Double()
    var walkingRunningDistance = Double()
    var flightsClmb = Int()
    var weightPar = Double()
    var heightPar = Double()
    
    func HealthStoreAvailability() {
        if HKHealthStore.isHealthDataAvailable() {
            let readTypes = Set([
                HKObjectType.quantityType(forIdentifier: .heartRate)!,
                HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                HKObjectType.quantityType(forIdentifier: .stepCount)!,
                HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
                HKObjectType.quantityType(forIdentifier: .flightsClimbed)!,
                HKObjectType.quantityType(forIdentifier: .bodyMass)!,
                HKObjectType.quantityType(forIdentifier: .bodyMassIndex)!,
                HKObjectType.quantityType(forIdentifier: .respiratoryRate)!,
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
    
    func FetchActivityData() {
        guard let heartRate = HKCategoryType.quantityType(forIdentifier: .heartRate) else { return }
        guard let sampleType = HKCategoryType.quantityType(forIdentifier: .stepCount) else { return }
        guard let walkingRunning = HKCategoryType.quantityType(forIdentifier: .distanceWalkingRunning) else { return }
        guard let flightsClimbed = HKCategoryType.quantityType(forIdentifier: .flightsClimbed) else { return }
        
        let startDate = Calendar.current.startOfDay(for: Date())
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
        var interval = DateComponents()
        interval.day = 1
        
        let queryHeartRate = HKStatisticsCollectionQuery(quantityType: heartRate, quantitySamplePredicate: predicate, options: [.mostRecent], anchorDate: startDate, intervalComponents: interval)
        queryHeartRate.initialResultsHandler = { query, result, error in
            if let myResult = result {
                myResult.enumerateStatistics(from: startDate, to: Date()) { statistics, value in
                    if let count = statistics.mostRecentQuantity() {
                        let val = count.doubleValue(for: HKUnit.count())
                        self.heartRate = Int(val)
                        debugPrint("Heart Rate: \(val) bpm")
                    }
                }
            }
        }
        
        let querySteps = HKStatisticsCollectionQuery(quantityType: sampleType, quantitySamplePredicate: predicate, options: [.cumulativeSum], anchorDate: startDate, intervalComponents: interval)
        querySteps.initialResultsHandler = { query, result, error in
            if let myResult = result {
                myResult.enumerateStatistics(from: startDate, to: Date()) { (statistics, value) in
                    if let count = statistics.sumQuantity() {
                        let val = count.doubleValue(for: HKUnit.count())
                        self.steps = val
                        print("Total steps: \(val) steps")
                    }
                }
            }
        }
        
        let queryWalkingRunning = HKStatisticsCollectionQuery(quantityType: walkingRunning, quantitySamplePredicate: predicate, options: [.cumulativeSum], anchorDate: startDate, intervalComponents: interval)
        queryWalkingRunning.initialResultsHandler = { query, result, error in
            if let myResult = result {
                myResult.enumerateStatistics(from: startDate, to: Date()) { (statistics, value) in
                    if let count = statistics.sumQuantity() {
                        let val = count.doubleValue(for: HKUnit.meter())
                        self.walkingRunningDistance = val
                        print("Walking running distance \(val) meters")
                    }
                }
            }
        }
        
        let queryFlightsClimbed = HKStatisticsCollectionQuery(quantityType: flightsClimbed, quantitySamplePredicate: predicate, options: [.cumulativeSum], anchorDate: startDate, intervalComponents: interval)
        queryFlightsClimbed.initialResultsHandler = { query, result, error in
            if let myResult = result {
                myResult.enumerateStatistics(from: startDate, to: Date()) { (statistics, value) in
                    if let count = statistics.sumQuantity() {
                        let val = count.doubleValue(for: HKUnit.count())
                        self.flightsClmb = Int(val)
                        print("Walking running distance \(val) meters")
                    }
                }
            }
        }
        
        let queries: [HKStatisticsCollectionQuery] = [querySteps, queryWalkingRunning, queryFlightsClimbed]
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
                        self.flightsClmb = Int(val)
                        print("Walking running distance \(val) meters")
                    }
                }
            }
        }
    }
    
    func GetMostRecentSample(for sampleType: HKSampleType, completion: @escaping (HKQuantitySample?, Error?) -> ()) {
        //1. Use HKQuery to load the most recent samples.
        let mostRecentPredicate = HKQuery.predicateForSamples(withStart: Date.distantPast,
                                                              end: Date(),
                                                              options: .strictEndDate)
        
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let limit = 1
        let sampleQuery = HKSampleQuery(sampleType: sampleType,
                                        predicate: mostRecentPredicate,
                                        limit: limit,
                                        sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            
            //2. Always dispatch to the main thread when complete.
            DispatchQueue.main.async {
                guard let samples = samples,
                      let mostRecentSample = samples.first as? HKQuantitySample else {
                          completion(nil, error)
                          return
                      }
                completion(mostRecentSample, nil)
            }
        }
        healthStore.execute(sampleQuery)
    }
    
    func FetchBodyMeasurements() {
        guard let weightSampleType = HKCategoryType.quantityType(forIdentifier: .bodyMass) else { return }
        guard let heightSampleType = HKCategoryType.quantityType(forIdentifier: .height) else { return }
        guard let bTemperatureSampleType = HKCategoryType.quantityType(forIdentifier: .bodyTemperature) else { return }
        
        let startDate = Calendar.current.startOfDay(for: Date())
        let endDate = Date()
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictStartDate)
        var interval = DateComponents()
        interval.day = 1
        
        let weightQuery = HKStatisticsCollectionQuery(quantityType: weightSampleType, quantitySamplePredicate: predicate, options: [.discreteAverage], anchorDate: startDate, intervalComponents: interval)
        weightQuery.initialResultsHandler = { query, result, error in
            if let myResult = result {
                myResult.enumerateStatistics(from: startDate, to: Date()) { (statistics, value) in
                    if let count = statistics.averageQuantity() {
                        let val = count.doubleValue(for: HKUnit.gram())
                        self.weightPar = val / 1000
                        print("Weight is: \(val) kg")
                    }
                }
            }
        }
        
        let heightQuery = HKStatisticsCollectionQuery(quantityType: heightSampleType, quantitySamplePredicate: predicate, options: [.discreteAverage], anchorDate: startDate, intervalComponents: interval)
        heightQuery.initialResultsHandler = { query, result, error in
            if let myResult = result {
                myResult.enumerateStatistics(from: startDate, to: Date()) { (statistics, value) in
                    if let count = statistics.averageQuantity() {
                        let val = count.doubleValue(for: HKUnit.gram())
                        self.heightPar = val
                        print("Height is: \(val) cm")
                    }
                }
            }
        }
        
        let measurementQueries: [HKStatisticsCollectionQuery] = [weightQuery, heightQuery]
        for query in measurementQueries {
            healthStore.execute(query)
        }
    }
    
    func FetchHealthData() {
        FetchActivityData()
        FetchBodyMeasurements()
    }
    
    func fetchSteps() -> Double { return steps }
    func fetchHeartRate() -> Int { return heartRate }
    func fetchWalkingRunningDistance() -> Double { return walkingRunningDistance }
    func fetchWeight() -> Double { return weightPar }
    func fetchSleep() -> Double { return 0.0 }
    func fetchWater() -> Int { return 1}
}
