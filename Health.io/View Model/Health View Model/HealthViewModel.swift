//
//  HealthViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/10/22.
//

import SwiftUI
import HealthKit

final class HealthViewModel {
    
    // ADD HEALTH SERVICE instance and read health data from HealthKit
    private var service: HealthServiceProtocol
    
    var healthTips = [
        HealthTip(image: "home1", title: "start_fasting", subtitle: nil, subtitleImage: nil, type: .noSubtitle),
        HealthTip(image: "books", title: "learn_about_health", subtitle: "learn_about_health_subtitle", subtitleImage: "book", type: .subtitleImage),
        HealthTip(image: "fasting", title: "end_fasting", subtitle: nil, subtitleImage: nil, type: .noSubtitle),
        HealthTip(image: "scale", title: "weight_yourself", subtitle: "weight_yourself_subtitle", subtitleImage: nil, type: .subtitle),
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
