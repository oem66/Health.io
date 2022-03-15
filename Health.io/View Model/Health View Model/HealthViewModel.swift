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
