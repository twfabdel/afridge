//
//  Recipe.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/21/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import Foundation

enum Difficulty: String {
    case Easy = "Easy"
    case Medium = "Medium"
    case Hard = "Hard"
    
    func toSort() -> Int {
        switch self {
        case .Easy:
            return 0
        case .Medium:
            return 1
        case .Hard:
            return 2
        }
    }
}

class Recipe {
    
    var name: String
    var rating: Double
    var favorite: Bool
    var cookTime: Int
    var difficulty: Difficulty
    //still doing a string description?
    var videoLink: String
    var imageString: String
    var ingredients: [FoodItem]
    
    init?(name: String, rating: Double, favorite: Bool, cookTime: Int, difficulty: Difficulty, videoLink: String, imageString: String, ingredients: [FoodItem]) {
        self.name = name
        self.rating = rating
        self.favorite = favorite
        self.cookTime = cookTime
        self.difficulty = difficulty
        self.videoLink = videoLink
        self.imageString = imageString
        self.ingredients = ingredients
        
        if name.isEmpty {
            return nil
        }
    }
    
    //for search from recipe search bar (not implemented in RecipeViewController yet)
    func ingredientsContainsSubstring(str: String) -> Bool {
        for curItem in ingredients {
            //check for substring in each item
            if (curItem.name.range(of: str) != nil) {
                return true;
            }
        }
        return false;
    }
    
}
