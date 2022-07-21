//
//  HealthViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/10/22.
//

import SwiftUI
import HealthKit
import Combine

enum HealthUnits: String {
    case bpm
    case kcal
    case steps
    case hours
}

final class HealthViewModel: ObservableObject {
    private var heartRate = 0
    private var calories = 0
    private var steps = 0
    private var sleep = 0.0
    
    @Published var healthKitData: [HealthKitData]
    
    init() {
        self.healthKitData = [
            HealthKitData(image: "health", title: "Heart Rate", unit: HealthUnits.bpm.rawValue, data: 75),
            HealthKitData(image: "calories", title: "Calories Burned", unit: HealthUnits.kcal.rawValue, data: 1240),
            HealthKitData(image: "steps", title: "Steps", unit: HealthUnits.steps.rawValue, data: 15358),
            HealthKitData(image: "sleep", title: "Sleep", unit: HealthUnits.hours.rawValue, data: 5.3)
        ]
    }
    
    var healthTips = [
        HealthTip(image: "home1", title: "start_fasting", subtitle: nil, subtitleImage: nil, type: .noSubtitle),
        HealthTip(image: "books", title: "learn_about_health", subtitle: "learn_about_health_subtitle", subtitleImage: "book", type: .subtitleImage),
        HealthTip(image: "fasting", title: "end_fasting", subtitle: nil, subtitleImage: nil, type: .noSubtitle),
        HealthTip(image: "scale", title: "weight_yourself", subtitle: "weight_yourself_subtitle", subtitleImage: nil, type: .subtitle),
    ]
    
//    @Published var healthKitData = [
//        HealthKitData(image: "health", title: "Heart Rate", unit: HealthUnits.bpm.rawValue, data: 75),
//        HealthKitData(image: "calories", title: "Calories Burned", unit: HealthUnits.kcal.rawValue, data: 1240),
//        HealthKitData(image: "steps", title: "Steps", unit: HealthUnits.steps.rawValue, data: 15358),
//        HealthKitData(image: "sleep", title: "Sleep", unit: HealthUnits.hours.rawValue, data: 5.3)
//    ] {
//        willSet {
//            objectWillChange.send()
//        }
//    }
    
    func readHealthData() {
        HealthService.shared.HealthStoreAvailability()
    }
    
    func fetchHealthData() {
        defer {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: { [weak self] in
                guard let self = self else { return }
                let data = HealthService.shared.getData()
                self.heartRate = data[0]
                self.healthKitData[0].data = Double(data[0])
                self.healthKitData[2].data = Double(data[1])
                self.steps = data[1]
                self.calories = data[2]
                self.healthKitData = [
                    HealthKitData(image: "health", title: "Heart Rate", unit: HealthUnits.bpm.rawValue, data: Double(data[0])),
                    HealthKitData(image: "calories", title: "Calories Burned", unit: HealthUnits.kcal.rawValue, data: 1240),
                    HealthKitData(image: "steps", title: "Steps", unit: HealthUnits.steps.rawValue, data: Double(data[1])),
                    HealthKitData(image: "sleep", title: "Sleep", unit: HealthUnits.hours.rawValue, data: 5.3)
                ]
            })
        }
        HealthService.shared.FetchHealthData()
        
        healthKitData[0].data = 333
        healthKitData[2].data = 999
    }
    
    func writeHealthData() {
        //        service.writeHealthData()
    }
}
