//
//  Recipe.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/21/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import Foundation

class Recipe {
    
    var name: String
    var rating: Double
    var favorite: Bool
    
    init?(name: String, rating: Double, favorite: Bool) {
        self.name = name
        self.rating = rating
        self.favorite = favorite
        
        if name.isEmpty {
            return nil
        }
    }
    
    
    
}
