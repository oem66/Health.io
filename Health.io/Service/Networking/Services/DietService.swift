//
//  DietService.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 13. 6. 2022..
//

import Foundation
import Combine

protocol DietProtocol {
    func getRecipes() -> AnyPublisher<DietRecipes,Error>
    func getDietHealthTips() -> [DietHealthTipsModel]
    func getFastingDiets() -> [DietPlanModel]
    func getBalancedDiets() -> [DietPlanModel]
    func getKetoLowCarbDiets() -> [DietPlanModel]
    func getHighProteinDiets() -> [DietPlanModel]
}

final class DietService: DietProtocol {
    internal func getRecipes() -> AnyPublisher<DietRecipes, Error> {
        var request = URLRequest(url: APIEndpoints.shared.recipeURL().url!)
        request.httpMethod = HTTPMethod.GET.rawValue
        request.allHTTPHeaderFields = APIEndpoints.shared.recipeHeaders
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: DietRecipes.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func getDietHealthTips() -> [DietHealthTipsModel] {
        let dietHealthTips = [
            DietHealthTipsModel(image: "food1", title: "Fasting", description: "16:8 fasting is very good for health"),
            DietHealthTipsModel(image: "food2", title: "Loose Weight", description: "Loosing weight improves your health"),
            DietHealthTipsModel(image: "food3", title: "Gain Muscle", description: "Muscle gain can be very good for your health"),
            DietHealthTipsModel(image: "food4", title: "Meal Plan", description: "Complete and quality diet is great for health")
        ]
        return dietHealthTips
    }
    
    func getFastingDiets() -> [DietPlanModel] {
        let fastingDiets = [
            DietPlanModel(image: "food1", title: "16:8 Morning Fasting", description: "21-day meal plan", dietPlan: ""),
            DietPlanModel(image: "food2", title: "16:8 Evening Fasting", description: "21-day meal plan", dietPlan: ""),
            DietPlanModel(image: "food3", title: "5:2 Fasting", description: "Fast 2 days/week", dietPlan: ""),
            DietPlanModel(image: "food4", title: "6:1 Fasting", description: "Fast 1 day/week", dietPlan: ""),
            DietPlanModel(image: "food2", title: "48h Fasting", description: "Fast 48h straight", dietPlan: ""),
        ]
        return fastingDiets
    }
    
    func getBalancedDiets() -> [DietPlanModel] {
        let balancedDiets = [
            DietPlanModel(image: "food1", title: "16:8 Morning Fasting", description: "21-day meal plan", dietPlan: ""),
            DietPlanModel(image: "food2", title: "16:8 Evening Fasting", description: "21-day meal plan", dietPlan: ""),
            DietPlanModel(image: "food3", title: "5:2 Fasting", description: "Fast 2 days/week", dietPlan: ""),
            DietPlanModel(image: "food4", title: "6:1 Fasting", description: "Fast 1 day/week", dietPlan: ""),
            DietPlanModel(image: "food2", title: "48h Fasting", description: "Fast 48h straight", dietPlan: "")
        ]
        return balancedDiets
    }
    
    func getKetoLowCarbDiets() -> [DietPlanModel] {
        let ketoLowCarbDiets = [
            DietPlanModel(image: "food1", title: "16:8 Morning Fasting", description: "21-day meal plan", dietPlan: ""),
            DietPlanModel(image: "food2", title: "16:8 Evening Fasting", description: "21-day meal plan", dietPlan: ""),
            DietPlanModel(image: "food3", title: "5:2 Fasting", description: "Fast 2 days/week", dietPlan: ""),
            DietPlanModel(image: "food4", title: "6:1 Fasting", description: "Fast 1 day/week", dietPlan: ""),
            DietPlanModel(image: "food2", title: "48h Fasting", description: "Fast 48h straight", dietPlan: ""),
        ]
        return ketoLowCarbDiets
    }
    
    func getHighProteinDiets() -> [DietPlanModel] {
        let highProteinDiets = [
            DietPlanModel(image: "food1", title: "16:8 Morning Fasting", description: "21-day meal plan", dietPlan: ""),
            DietPlanModel(image: "food2", title: "16:8 Evening Fasting", description: "21-day meal plan", dietPlan: ""),
            DietPlanModel(image: "food3", title: "5:2 Fasting", description: "Fast 2 days/week", dietPlan: ""),
            DietPlanModel(image: "food4", title: "6:1 Fasting", description: "Fast 1 day/week", dietPlan: ""),
            DietPlanModel(image: "food2", title: "48h Fasting", description: "Fast 48h straight", dietPlan: ""),
        ]
        return highProteinDiets
    }
}
