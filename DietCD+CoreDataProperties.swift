//
//  DietCD+CoreDataProperties.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 4. 7. 2022..
//
//

import Foundation
import CoreData


extension DietCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DietCD> {
        return NSFetchRequest<DietCD>(entityName: "DietCD")
    }

    @NSManaged public var title: String?
    @NSManaged public var dietDescription: String?
    @NSManaged public var type: String?

}

extension DietCD : Identifiable {

}
