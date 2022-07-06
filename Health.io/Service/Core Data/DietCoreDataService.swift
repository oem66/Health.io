//
//  DietCoreDataService.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 4. 7. 2022..
//

import UIKit
import CoreData

protocol DietCoreDataServiceProtocol {
    func saveDietData(title: String, description: String, type: String)
    func deleteDietData()
    func getFilteredDietdData()
}

class DietCoreDataService: DietCoreDataServiceProtocol {
    func saveDietData(title: String, description: String, type: String) {
        let dietCD = DietCD(context: PersistanceService.context)
        dietCD.title = title
        dietCD.dietDescription = description
        dietCD.type = type
        PersistanceService.saveContext()
    }
    
    func deleteDietData() {
        
    }
    
    func getFilteredDietdData() {
        
    }
}
