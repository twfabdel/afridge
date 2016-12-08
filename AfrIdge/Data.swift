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
    
    
    var favoritedRecipes = [Recipe(name:"Vanilla Milk Shake", rating: 5, favorite: true, cookTime: 10, difficulty: Difficulty.Easy, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Shrimp Linguini", rating: 4.5, favorite: true, cookTime: 40, difficulty: Difficulty.Hard, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Cheese Burger", rating: 4.0, favorite: true, cookTime: 20, difficulty: Difficulty.Medium, description: "Holy Moly this is going to be a really long dummy description in order to test if the detail recipe view controller is scrolling correctly. We shall see. Also, Tarek is a huge bitch. There's a little easter egg for you. Blah blah blah blah chode blah blah blah couple more lines upcoming cause dis string so long fam. Okay but forreal though we need a couple more lines to reeeeaaaalllly  test if it will scroll or not. ya dig?", videoLink: "https://www.youtube.com/watch?v=C5Hq4mjMJQM", imageString: "spaghetti-pie", ingredients: [FoodItem(name: "Cheese", amount: "1 lb", days: 15)!, FoodItem(name: "Ground Beef", amount: "2 lbs", days: 10)!, FoodItem(name: "Pickles", amount: "3", days: 20)!, FoodItem(name: "Tomatoes", amount: "4", days: 12)!, FoodItem(name: "lettuce", amount: "5 cups", days: 12)!])!]
    
    
    var allRecipes = [Recipe(name:"Tofu Sautee", rating: 3.5, favorite: false, cookTime: 40, difficulty: Difficulty.Medium, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Chicken Marsala", rating: 4.5, favorite: false, cookTime: 40, difficulty: Difficulty.Medium, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Chicken Parm", rating: 2.5, favorite: false, cookTime: 40, difficulty: Difficulty.Medium, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Southwestern Scramble", rating: 3.0, favorite: false, cookTime: 40, difficulty: Difficulty.Easy, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Roasted Brussel Sprouts", rating: 4.0, favorite: false, cookTime: 40, difficulty: Difficulty.Easy, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Vanilla Milk Shake", rating: 5, favorite: true, cookTime: 10, difficulty: Difficulty.Easy, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Shrimp Linguini", rating: 4.5, favorite: true, cookTime: 40, difficulty: Difficulty.Hard, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Cheese Burger", rating: 4.0, favorite: true, cookTime: 20, difficulty: Difficulty.Medium, description: "Holy Moly this is going to be a really long dummy description in order to test if the detail recipe view controller is scrolling correctly. We shall see. Also, Tarek is a huge bitch. There's a little easter egg for you. Blah blah blah blah chode blah blah blah couple more lines upcoming cause dis string so long fam. Okay but forreal though we need a couple more lines to reeeeaaaalllly  test if it will scroll or not. ya dig?", videoLink: "https://www.youtube.com/watch?v=C5Hq4mjMJQM", imageString: "spaghetti-pie", ingredients: [FoodItem]())!]
    
    var inventoryItems = [FoodItem(name: "Cheese", amount: "2 lbs", days: 1)!, FoodItem(name: "Yogurt", amount: "0.5 gal", days: 3)!, FoodItem(name: "Milk", amount: "1 gal", days: 2)!, FoodItem(name: "Chicken", amount: "1.5 lbs", days: 4)!, FoodItem(name: "Apples", amount: "5", days: 5)!, FoodItem(name: "Oranges", amount: "8", days: 6)!, FoodItem(name: "Ketchup", amount: "16 oz", days: 8)!, FoodItem(name: "Mustard", amount: "10 oz", days: 14)!]
    
    func addInventoryItem(item: FoodItem) {
        self.inventoryItems.append(item)
    }
    
    var toBuy = [GroceryListItem(food: "whole milk", amount: "1 gal", isChecked: false)!,GroceryListItem(food: "eggs", amount: "1 doz", isChecked: false)!, GroceryListItem(food: "swiss cheese", amount: "0.5 lbs", isChecked: false)!, GroceryListItem(food: "red apples", amount: "6", isChecked: false)!,GroceryListItem(food: "chicken legs", amount: "2.5 lbs", isChecked: false)!, GroceryListItem(food: "pears", amount: "5", isChecked: true)!]
    
    var bought = [GroceryListItem]()
    
    func addInventoryItemToGrocery(name: String, amount: String) {
        for i in 0...self.toBuy.count - 1 {
            if self.toBuy[i].food.lowercased() == name.lowercased() {
                let split1 = amount.components(separatedBy: " ")
                let split2 = self.toBuy[i].amount.components(separatedBy: " ")
                
                let floatAmt = (split1[0] as NSString).floatValue + (split2[0] as NSString).floatValue
                var newAmt = "\(floatAmt)"
                if floatAmt.truncatingRemainder(dividingBy: 1.0) == 0 {
                    newAmt = "\(Int(floatAmt))"
                }
                
                if split1.count > 1 {
                    self.toBuy[i].amount = newAmt + " " + split1[1]
                } else if split2.count > 1 {
                    self.toBuy[i].amount = newAmt + " " + split2[1]
                } else {
                    self.toBuy[i].amount = newAmt
                }
                return
            }
        }
        self.toBuy.insert(GroceryListItem(food: name, amount: amount, isChecked: false)!, at: 0)
    }
    
    func uncheckItem(index: Int) {
        let item = self.bought[index]
        self.bought.remove(at: index)
        self.toBuy.insert(item, at:0)
    }
    
    func checkItem(index: Int) {
        let item = self.toBuy[index]
        self.toBuy.remove(at: index)
        self.bought.insert(item, at:0)
    }
    
    func addGroceryItem(item: GroceryListItem) {
        self.toBuy.insert(item, at:0)
    }
    
    func editItem(index: Int, isChecked: Bool, food: String, amount: String){
        if isChecked {
            self.bought[index].food = food
            self.bought[index].amount = amount
        } else {
            self.toBuy[index].food = food
            self.toBuy[index].amount = amount
        }
    }
    
    func deleteItem(index: Int, isChecked: Bool) {
        if isChecked {
            self.bought.remove(at: index)
        } else {
            self.toBuy.remove(at: index)
        }
    }
    
}
