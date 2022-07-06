//
//  DietAPI.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 4. 7. 2022..
//

import Foundation

protocol DietAPIProtocol {
    func getData()
    func saveToFavorites()
    func saveToCoreData()
}

final class DietAPI: DietAPIProtocol {
    var coreDataService = DietCoreDataService()
    var networkService = DietService()
    
    // MARK: - Fetch data from WebAPI or Firebase
    func getData() {
        var data = networkService.getRecipes()
        debugPrint("Data: \(data)")
    }
    
    // MARK: - Save Diet to favorites
    func saveToFavorites() {
        
    }
    
    // MARK: - Use CoreData Service and save data
    func saveToCoreData() {
        
    }
}
