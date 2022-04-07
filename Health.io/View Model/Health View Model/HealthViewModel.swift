//
//  HealthViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/10/22.
//

import Foundation
import HealthKit

final class HealthViewModel {
    
    // ADD HEALTH SERVICE instance and read health data from HealthKit
    private var service: HealthServiceProtocol
    
    var healthTips = [
        HealthTip(image: "", title: "Start your fasting phase", subtitle: nil, subtitleImage: nil, type: .noSubtitle),
        HealthTip(image: "", title: "Learn about health improvement", subtitle: "5 min", subtitleImage: "book", type: .subtitleImage),
        HealthTip(image: "", title: "End your current fasting phase at 8:30pm", subtitle: nil, subtitleImage: nil, type: .noSubtitle),
        HealthTip(image: "", title: "Time to weight yourself", subtitle: "Control your weight and keep track of your progress", subtitleImage: nil, type: .subtitle),
    ]
    
    init(service: HealthServiceProtocol = HealthService()) {
        self.service = service
    }
    
    func readHealthData() {
        service.HealthStoreAvailability()
    }
    
    func writeHealthData() {
//        service.writeHealthData()
    }
}
