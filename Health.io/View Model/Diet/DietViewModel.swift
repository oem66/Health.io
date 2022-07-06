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
    
    private var dietRecipesSubscribers: AnyCancellable?
    @Published var dietRecipes = DietRecipes()
    
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
    
    func getRecipeData(completion: @escaping ()->()) {
        dietRecipesSubscribers = service.getRecipes().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                debugPrint("Request is successfull.")
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }, receiveValue: { [weak self] dietRecipes in
            guard let self = self else { return }
            self.dietRecipes = dietRecipes
            debugPrint("Diet Recipes: \(dietRecipes)")
        })
        completion()
    }
    
    func saveDietDataToCoreData(recipe: Feed) {
        debugPrint("Save recipe to favorites on device")
        coreDataService.saveDietData(title: "Test title", description: "Test description", type: "Test type")
    }
    
    func handleFavouriteButtonTapped() {
        defer {
            saveDietDataToCoreData(recipe: Feed())
        }
        debugPrint("Save to favourites is tapped!")
        // Create custom object and populate property in view model
        // After object is downloaded and created defer will execute save to core data method
    }
}
