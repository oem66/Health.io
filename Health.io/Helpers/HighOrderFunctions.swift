//
//  HighOrderFunctions.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 5/31/22.
//

import Foundation

struct HighOrderFunctions {
    var diets = ["Low Carb", "High Protein", nil, "Vegan", "Vegetarian", nil, "Keto", nil, nil, "Fasting", nil, nil, "Intermitent Fasting"]
    
    mutating func mapFunction() {
        let titleDiets = diets.map({ diet in
            return diet?.uppercased()
        })
        debugPrint("Title diets: \(titleDiets)")
    }
    
    mutating func compactMapFunction() {
        let withoutNil = diets.compactMap { diet in
            return diet?.uppercased()
        }
        debugPrint("Non Nil values: \(withoutNil)")
    }
    
    mutating func flatMapFunction() {
        let words: [[String]] = [["room", "home"], ["train", "green"], ["hero"]]
        
        let singleArray = words.flatMap { $0 }
        debugPrint("Flat Map Array: \(singleArray)")
    }
}
