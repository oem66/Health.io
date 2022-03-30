//
//  FastingDietViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 3/30/22.
//

import Foundation

final class FastingDietViewModel {
    var fastingDiets = [
        FastingDietModel(image: "food1", title: "16:8 Morning Fasting", description: "21-day meal plan", dietPlan: ""),
        FastingDietModel(image: "food2", title: "16:8 Evening Fasting", description: "21-day meal plan", dietPlan: ""),
        FastingDietModel(image: "food3", title: "5:2 Fasting", description: "Fast 2 days/week", dietPlan: ""),
        FastingDietModel(image: "food4", title: "6:1 Fasting", description: "Fast 1 day/week", dietPlan: ""),
        FastingDietModel(image: "food2", title: "48h Fasting", description: "Fast 48h straight", dietPlan: ""),
    ]
}
