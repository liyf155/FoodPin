//
//  Restaurant.swift
//  FoodPin
//
//  Created by kevin lee on 16/6/1.
//  Copyright © 2016年 kevin lee. All rights reserved.
//

import Foundation

struct Restaurant {
    var name: String
    var type: String
    var location: String
    var image: String
    var isVisited: Bool
    var rating = ""
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}

