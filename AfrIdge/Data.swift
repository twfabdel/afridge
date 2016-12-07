//
//  Data.swift
//  AfrIdge
//
//  Created by Brian Rossi on 12/3/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import Foundation

class Data {
    static let sharedData = Data()
    var favoritedRecipes = [Recipe(name:"Vanilla Milk Shake", rating: 5, favorite: true, cookTime: 10, difficulty: Difficulty.Easy, description: "this is a dummy description", videoLink: "emptyLink", imageString: "question_mark", ingredients: [FoodItem]())!, Recipe(name:"Shrimp Linguini", rating: 4.5, favorite: true, cookTime: 40, difficulty: Difficulty.Hard, description: "this is a dummy description", videoLink: "emptyLink", imageString: "question_mark", ingredients: [FoodItem]())!, Recipe(name:"Cheese Burger", rating: 4.0, favorite: true, cookTime: 20, difficulty: Difficulty.Medium, description: "Holy Moly this is going to be a really long dummy description in order to test if the detail recipe view controller is scrolling correctly. We shall see. Also, Tarek is a huge bitch. There's a little easter egg for you. Blah blah blah blah chode blah blah blah couple more lines upcoming cause dis string so long fam. Okay but forreal though we need a couple more lines to reeeeaaaalllly  test if it will scroll or not. ya dig?", videoLink: "emptyLink", imageString: "question_mark", ingredients: [FoodItem]())!]
    
    var unfavoritedRecipes = [Recipe(name:"Tofu Sautee", rating: 3.5, favorite: false, cookTime: 40, difficulty: Difficulty.Medium, description: "this is a dummy description", videoLink: "emptyLink", imageString: "question_mark", ingredients: [FoodItem]())!, Recipe(name:"Chicken Marsala", rating: 4.5, favorite: false, cookTime: 40, difficulty: Difficulty.Medium, description: "this is a dummy description", videoLink: "emptyLink", imageString: "question_mark", ingredients: [FoodItem]())!, Recipe(name:"Chicken Parm", rating: 2.5, favorite: false, cookTime: 40, difficulty: Difficulty.Medium, description: "this is a dummy description", videoLink: "emptyLink", imageString: "question_mark", ingredients: [FoodItem]())!, Recipe(name:"Southwestern Scramble", rating: 3.0, favorite: false, cookTime: 40, difficulty: Difficulty.Easy, description: "this is a dummy description", videoLink: "emptyLink", imageString: "question_mark", ingredients: [FoodItem]())!, Recipe(name:"Roasted Brussel Sprouts", rating: 4.0, favorite: false, cookTime: 40, difficulty: Difficulty.Easy, description: "this is a dummy description", videoLink: "emptyLink", imageString: "question_mark", ingredients: [FoodItem]())!]
    
    var inventoryItems = [FoodItem(name: "Cheese", amount: "2 lbs", days: 1)!, FoodItem(name: "Yogurt", amount: "0.5 gal", days: 3)!, FoodItem(name: "Milk", amount: "1 gal", days: 2)!, FoodItem(name: "Chicken", amount: "1.5 lbs", days: 4)!, FoodItem(name: "Apples", amount: "5", days: 5)!, FoodItem(name: "Oranges", amount: "8", days: 6)!, FoodItem(name: "Ketchup", amount: "16 oz", days: 8)!, FoodItem(name: "Mustard", amount: "10 oz", days: 14)!]
    
}
