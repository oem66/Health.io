//
//  DietRecipes.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 6. 7. 2022..
//

import Foundation

struct DietRecipes: Decodable {
    var feed: [Feed]?
}

struct Feed: Decodable {
    var display: Display?
}

struct Display: Decodable {
    var displayName: String?
    var images: [String]?
    var content: Content?
}

struct Content: Decodable {
    var details: ContentDetails?
    var ingredientLines: [IngredientLine]?
}

struct IngredientLine: Decodable {
    var category: String?
    var amoount: IngredientAmount?
}

struct IngredientAmount: Decodable {
    var metric: IngredientAmountMetric?
}

struct IngredientAmountMetric: Decodable {
    var unit: IngredientAmountMetricUnit?
    var quantity: Int?
}

struct IngredientAmountMetricUnit: Decodable {
    var name: String?
    var abbrevitation: String?
}

struct ContentDetails: Decodable {
    var name: String?
    
}
