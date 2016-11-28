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
    var cookTime: Int
    var videoLink: String
    //how are we specifying amount of a food?
    //should we just have an array of inventory-type items?
    var ingredients: [String: Int]
    
    init?(name: String, rating: Double, favorite: Bool, cookTime: Int, videoLink: String, ingredients: [String: Int]) {
        self.name = name
        self.rating = rating
        self.favorite = favorite
        self.cookTime = cookTime;
        self.videoLink = videoLink;
        self.ingredients = ingredients;
        
        if name.isEmpty {
            return nil
        }
    }
    
    
    
}
