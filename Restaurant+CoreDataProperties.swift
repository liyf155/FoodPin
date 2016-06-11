//
//  Restaurant+CoreDataProperties.swift
//  FoodPin
//
//  Created by kevin lee on 16/6/9.
//  Copyright © 2016年 kevin lee. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Restaurant {

    @NSManaged var name: String?
    @NSManaged var location: String?
    @NSManaged var type: String?
    @NSManaged var rating: String?
    @NSManaged var isVisited: NSNumber?
    @NSManaged var image: NSData?
    @NSManaged var mobile: String?

}
