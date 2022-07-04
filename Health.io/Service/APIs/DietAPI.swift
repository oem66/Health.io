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
    // persistance instance
    // networking instance
    // status instance active/passive
    
    
    // MARK: - Fetch data from WebAPI or Firebase
    func getData() {
        
    }
    
    // MARK: - Save Diet to favorites
    func saveToFavorites() {
        
    }
    
    // MARK: - Use CoreData Service and save data
    func saveToCoreData() {
        
    }
}
