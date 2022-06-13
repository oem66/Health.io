//
//  DietViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 3/30/22.
//

import Foundation
import Combine

// THIS VIEW MODEL WILL HAVE SIMILAR STRUCTURE AS THIS ONE https://github.com/oem66/Buildify-/blob/master/Buildify/View%20Model/CreateChallengeViewModel.swift

enum DietType {
    case fasting([DietPlanModel], String)
    case balanced([DietPlanModel], String)
    case ketoLowCarb([DietPlanModel], String)
    case highProtein([DietPlanModel], String)
}

final class DietViewModel: ObservableObject {
    
    // put enum inside view model
    // create multiple services to fetch diet data
    
    private let service: DietProtocol
    
    init(service: DietProtocol = DietService()) {
        self.service = service
    }
    
    var dietHealthTips = [
        DietHealthTipsModel(image: "food1", title: "Fasting", description: "16:8 fasting is very good for health"),
        DietHealthTipsModel(image: "food2", title: "Loose Weight", description: "Loosing weight improves your health"),
        DietHealthTipsModel(image: "food3", title: "Gain Muscle", description: "Muscle gain can be very good for your health"),
        DietHealthTipsModel(image: "food4", title: "Meal Plan", description: "Complete and quality diet is great for health")
    ]
    
    var fastingDiets = [
        DietPlanModel(image: "food1", title: "16:8 Morning Fasting", description: "21-day meal plan", dietPlan: ""),
        DietPlanModel(image: "food2", title: "16:8 Evening Fasting", description: "21-day meal plan", dietPlan: ""),
        DietPlanModel(image: "food3", title: "5:2 Fasting", description: "Fast 2 days/week", dietPlan: ""),
        DietPlanModel(image: "food4", title: "6:1 Fasting", description: "Fast 1 day/week", dietPlan: ""),
        DietPlanModel(image: "food2", title: "48h Fasting", description: "Fast 48h straight", dietPlan: ""),
    ]
    
    var balancedDiets = [
        DietPlanModel(image: "food1", title: "16:8 Morning Fasting", description: "21-day meal plan", dietPlan: ""),
        DietPlanModel(image: "food2", title: "16:8 Evening Fasting", description: "21-day meal plan", dietPlan: ""),
        DietPlanModel(image: "food3", title: "5:2 Fasting", description: "Fast 2 days/week", dietPlan: ""),
        DietPlanModel(image: "food4", title: "6:1 Fasting", description: "Fast 1 day/week", dietPlan: ""),
        DietPlanModel(image: "food2", title: "48h Fasting", description: "Fast 48h straight", dietPlan: "")
    ]
    
    var ketoLowCarbDiets = [
        DietPlanModel(image: "food1", title: "16:8 Morning Fasting", description: "21-day meal plan", dietPlan: ""),
        DietPlanModel(image: "food2", title: "16:8 Evening Fasting", description: "21-day meal plan", dietPlan: ""),
        DietPlanModel(image: "food3", title: "5:2 Fasting", description: "Fast 2 days/week", dietPlan: ""),
        DietPlanModel(image: "food4", title: "6:1 Fasting", description: "Fast 1 day/week", dietPlan: ""),
        DietPlanModel(image: "food2", title: "48h Fasting", description: "Fast 48h straight", dietPlan: ""),
    ]
    
    var highProteinDiets = [
        DietPlanModel(image: "food1", title: "16:8 Morning Fasting", description: "21-day meal plan", dietPlan: ""),
        DietPlanModel(image: "food2", title: "16:8 Evening Fasting", description: "21-day meal plan", dietPlan: ""),
        DietPlanModel(image: "food3", title: "5:2 Fasting", description: "Fast 2 days/week", dietPlan: ""),
        DietPlanModel(image: "food4", title: "6:1 Fasting", description: "Fast 1 day/week", dietPlan: ""),
        DietPlanModel(image: "food2", title: "48h Fasting", description: "Fast 48h straight", dietPlan: ""),
    ]
}
