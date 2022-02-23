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
