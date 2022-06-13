//
//  DietViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 3/30/22.
//

import Foundation
import Combine

enum DietType {
    case fasting
    case balanced
    case ketoLowCarb
    case highProtein
}

final class DietViewModel: ObservableObject {
    private let service: DietProtocol
    var dietPlan = [DietPlanModel]()
    
    init(service: DietProtocol = DietService()) {
        self.service = service
    }
    
    func getDietHealthTips() -> [DietHealthTipsModel] {
        return service.getDietHealthTips()
    }
    
    func getDietData(_ dietType: DietType) -> [DietPlanModel] {
        switch dietType {
        case .fasting:
            dietPlan = service.getFastingDiets()
        case .balanced:
            dietPlan = service.getBalancedDiets()
        case .ketoLowCarb:
            dietPlan = service.getKetoLowCarbDiets()
        case .highProtein:
            dietPlan = service.getHighProteinDiets()
        }
        return dietPlan
    }
}
