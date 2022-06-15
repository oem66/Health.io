//
//  HealthViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/10/22.
//

import SwiftUI
import HealthKit

enum HealthUnits: String {
    case bpm
    case kcal
    case steps
    case hours
}

final class HealthViewModel {
    
    // MARK: ADD HEALTH SERVICE instance and read health data from HealthKit
    private var service: HealthServiceProtocol
    
    var healthTips = [
        HealthTip(image: "home1", title: "start_fasting", subtitle: nil, subtitleImage: nil, type: .noSubtitle),
        HealthTip(image: "books", title: "learn_about_health", subtitle: "learn_about_health_subtitle", subtitleImage: "book", type: .subtitleImage),
        HealthTip(image: "fasting", title: "end_fasting", subtitle: nil, subtitleImage: nil, type: .noSubtitle),
        HealthTip(image: "scale", title: "weight_yourself", subtitle: "weight_yourself_subtitle", subtitleImage: nil, type: .subtitle),
    ]
    
    var healthKitData = [
        HealthKitData(image: "health", title: "Heart Rate", unit: HealthUnits.bpm.rawValue, data: 75),
        HealthKitData(image: "calories", title: "Calories Burned", unit: HealthUnits.kcal.rawValue, data: 1240),
        HealthKitData(image: "steps", title: "Steps", unit: HealthUnits.steps.rawValue, data: 15358),
        HealthKitData(image: "sleep", title: "Sleep", unit: HealthUnits.hours.rawValue, data: 5.3)
    ]
    
    init(service: HealthServiceProtocol = HealthService()) {
        self.service = service
    }
    
    func readHealthData() {
        service.HealthStoreAvailability()
    }
    
    func fetchHealthData() {
        service.FetchHealthData()
    }
    
    func writeHealthData() {
//        service.writeHealthData()
    }
}
