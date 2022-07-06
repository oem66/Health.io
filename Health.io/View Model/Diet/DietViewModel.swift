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
    private let coreDataService: DietCoreDataServiceProtocol
    var dietPlan = [DietPlanModel]()
    
    init(service: DietProtocol = DietService(), coreDataService: DietCoreDataServiceProtocol = DietCoreDataService()) {
        self.service = service
        self.coreDataService = coreDataService
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
    
    func saveDietDataToCoreData(recipe: Feed) {
        debugPrint("Save recipe to favorites on device")
    }
}
