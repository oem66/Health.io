//
//  HealthService.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/15/22.
//

import Foundation
import HealthKit

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
    func readHealthData()
    func writeHealthData()
}

class HealthService: HealthServiceProtocol {
    
    private var healthStore = HKHealthStore()
    
    func HealthStoreAvailability() {
        if HKHealthStore.isHealthDataAvailable() {
            let readTypes = Set([
                HKObjectType.quantityType(forIdentifier: .heartRate)!,
                HKObjectType.quantityType(forIdentifier: .restingHeartRate)!,
                HKObjectType.quantityType(forIdentifier: .walkingHeartRateAverage)!,
                HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!,
                HKObjectType.quantityType(forIdentifier: .walkingSpeed)!,
                HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                HKObjectType.quantityType(forIdentifier: .stepCount)!,
                HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning)!,
                HKObjectType.quantityType(forIdentifier: .flightsClimbed)!,
                HKObjectType.quantityType(forIdentifier: .height)!,
                //                HKObjectType.quantityType(forIdentifier: .weight)!,
                HKObjectType.quantityType(forIdentifier: .bodyMassIndex)!,
                HKObjectType.quantityType(forIdentifier: .oxygenSaturation)!,
                HKObjectType.quantityType(forIdentifier: .respiratoryRate)!,
                //                HKObjectType.quantityType(forIdentifier: .sleepAnalysis)!,
                HKObjectType.quantityType(forIdentifier: .uvExposure)!,
                HKObjectType.quantityType(forIdentifier: .bloodGlucose)!,
                //                HKObjectType.quantityType(forIdentifier: .mindfulSession)!,
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
    
    func readHealthData() {
        if HKHealthStore.isHealthDataAvailable() {
            let readTypes = Set([
                HKObjectType.quantityType(forIdentifier: .activeEnergyBurned)!,
                HKObjectType.quantityType(forIdentifier: .oxygenSaturation)!,
                HKObjectType.quantityType(forIdentifier: .bodyTemperature)!,
                HKObjectType.quantityType(forIdentifier: .heartRate)!,
                HKObjectType.quantityType(forIdentifier: .stepCount)!,
                HKObjectType.quantityType(forIdentifier: .uvExposure)!,
                HKObjectType.quantityType(forIdentifier: .appleExerciseTime)!,
                HKObjectType.quantityType(forIdentifier: .uvExposure)!,
                HKObjectType.quantityType(forIdentifier: .height)!,
                HKObjectType.quantityType(forIdentifier: .respiratoryRate)!,
                HKObjectType.quantityType(forIdentifier: .vo2Max)!,
                
                HKObjectType.categoryType(forIdentifier: .lossOfSmell)!,
                HKObjectType.categoryType(forIdentifier: .lossOfTaste)!,
                HKObjectType.categoryType(forIdentifier: .soreThroat)!,
                HKObjectType.categoryType(forIdentifier: .appleStandHour)!,
                HKObjectType.categoryType(forIdentifier: .sleepChanges)!,
                HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
                HKObjectType.categoryType(forIdentifier: .vomiting)!,
                
                //                HKObjectType.clinicalType(forIdentifier: .allergyRecord)!,
                //                HKObjectType.clinicalType(forIdentifier: .immunizationRecord)!,
                //                HKObjectType.clinicalType(forIdentifier: .vitalSignRecord)!,
                //                HKObjectType.clinicalType(forIdentifier: .conditionRecord)!,
                //                HKObjectType.clinicalType(forIdentifier: .labResultRecord)!
            ])
            
            healthStore.requestAuthorization(toShare: nil, read: readTypes) { success, error in
                if !success { debugPrint("Can't read data from HealthKit") }
                else {
                    // FetchDataFromHealthKit()
                }
            }
        }
    }
    
    func writeHealthData() {
        debugPrint("Write data to HealthKit")
    }
}
