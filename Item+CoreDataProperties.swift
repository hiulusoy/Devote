//
//  Item+CoreDataProperties.swift
//  Devote
//
//  Created by Halil Usanmaz on 20.07.2022.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var task: String?

}

extension Item : Identifiable {

}
