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
    
    mutating func reduceFunction() {
        let numbers = [1,2,3,4,5,6,7,8]
        let sum = numbers.reduce(0, { $0 + $1 })
    }
    
    mutating func filterFunction() {
        var diets1 = ["Low Carb", "High Protein", "Vegan", "Vegetarian", "Keto", "Fasting", "Intermitent Fasting"]
        let wordsWithV = diets1.filter { $0.contains("V") && $0.count >= 3 }
    }
    
    mutating func sortedFunction() {
        var numbers = [2,4,6,2,3,4,9,8,12,54,23,67]
        let sortedNumbers = numbers.sorted { firstValue, secondValue in
            return firstValue > secondValue
        }
        debugPrint("Sorted numbers: \(sortedNumbers)")
    }
}
