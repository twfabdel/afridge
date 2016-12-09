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
    
    
    var favoritedRecipes = [Recipe(name:"Vanilla Milk Shake", rating: 5, favorite: true, cookTime: 5, difficulty: Difficulty.Easy, description: "Using a blender or milkshake machine, blend all ingredients together until smooth. Serve in tall glass with straw.", videoLink: "https://www.youtube.com/watch?v=qK8UT1u59Qc", imageString: "milkshake", ingredients: [FoodItem(name: "Ice Cream", amount: "4 cups", days: 20)!, FoodItem(name: "Sugar", amount: "8 tbsp", days: 20)!, FoodItem(name: "Vanilla Extract", amount: "2 tsp", days: 20)!, FoodItem(name: "Milk", amount: "2 cups", days: 20)!])!, Recipe(name:"Shrimp Linguine", rating: 4.5, favorite: true, cookTime: 30, difficulty: Difficulty.Hard, description: "Drizzle some oil in a large pot of boiling salted water, add 1 tablespoon of salt and the linguine, and cook for 7 to 10 minutes, or according to the directions on the package. Meanwhile, in another large (12-inch), heavy-bottomed pan, melt the butter and olive oil over medium-low heat. Add the garlic. Saute for 1 minute. Be careful, the garlic burns easily! Add the shrimp, 1 1/2 teaspoons of salt, and the pepper and saute until the shrimp have just turned pink, about 5 minutes, stirring often. Remove from the heat, add the parsley, lemon zest, lemon juice, lemon slices, and red pepper flakes. Toss to combine. When the pasta is done, drain the cooked linguine and then put it back in the pot. Immediately add the shrimp and sauce, toss well, and serve.", videoLink: "https://www.youtube.com/watch?v=LHXBfEZ5z9c", imageString: "shrimp-linguine", ingredients: [FoodItem(name: "Salt", amount: "2 tbsp", days: 20)!, FoodItem(name: "Linguine", amount: "3/4 lbs", days: 20)!, FoodItem(name: "Butter", amount: "3 tbsp", days: 20)!, FoodItem(name: "Olive Oil", amount: "2.5 tbsp", days: 20)!, FoodItem(name: "Shrimp", amount: "16", days: 20)!, FoodItem(name: "Lemon", amount: ".5", days: 20)!, FoodItem(name: "Red Pepper Flakes", amount: ".125 tsp", days: 20)!, FoodItem(name: "Parsely Leaves", amount: "1/3 cup", days: 20)!, FoodItem(name: "Black Pepper", amount: ".25 tsp", days: 20)!]), Recipe(name:"Cheese Burger", rating: 4.0, favorite: true, cookTime: 20, difficulty: Difficulty.Medium, description: "1. In a medium bowl, combine cubed chuck roll, salt, black pepper, thyme, and sliced garlic. Stir to coat. Cover and refrigerate to cure overnight. 2. Prepare the sauce: in a small mixing bowl, combine the mayonnaise, ketchup, relish, vinegar, lemon juice, salt, and pepper. Whisk together. Refrigerate to bring flavors together. 3. Using a stand mixer fitted with meat grinder attachment, grind the cured meat, layering in pieces of chopped bacon throughout. (Ensure the meat and grinder attachments are very cold before grinding! Recommended that you place it in the freezer for a few minutes just before using.) 4. Lightly mix together the ground meat and then form into six, 3 ounce balls. 5. To a hot, oiled, cast iron skillet, over medium/high heat - add the balls and allow to cook slightly. Using two spatulas layered on top of one another, press down on the burger to form into thin patties. Continue to cook until the underside has browned and caramelized. 6. Flip the burgers and continue to cook until the second side just begins to brown. Top with cheese and remove from the skillet. 7. To assemble: Spread the burger sauce onto both halves of a toasted potato bun. On the bottom bun, layer lettuce, tomato, and a sprinkle of salt. Add one burger patty, thinly sliced onions, then the second burger patty. Place 4 pickles onto the top bun and place on top of the burger. Enjoy!", videoLink: "https://www.youtube.com/watch?v=C5Hq4mjMJQM", imageString: "cheeseburger", ingredients: [FoodItem(name: "Cheese", amount: ".5 lbs", days: 20)!, FoodItem(name: "Ground Beef", amount: "1 lb", days: 20)!, FoodItem(name: "Pickles", amount: "8", days: 20)!, FoodItem(name: "Tomatoes", amount: "2", days: 20)!, FoodItem(name: "Hamburger Buns", amount: "4", days: 20)!, FoodItem(name: "Fresh Thyme", amount: "1 tbsp", days: 20)!, FoodItem(name: "Black Pepper", amount: ".5 tbsp", days: 20)!, FoodItem(name: "Garlic", amount: "1 clove", days: 20)!, FoodItem(name: "Bacon", amount: ".5 lbs", days: 20)!, FoodItem(name: "lettuce", amount: ".5 lbs", days: 20)!])!]
    
    
    var allRecipes = [Recipe(name:"Tofu Sautee", rating: 3.5, favorite: false, cookTime: 40, difficulty: Difficulty.Medium, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Chicken Marsala", rating: 4.5, favorite: false, cookTime: 40, difficulty: Difficulty.Medium, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Chicken Parm", rating: 2.5, favorite: false, cookTime: 40, difficulty: Difficulty.Medium, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Southwestern Scramble", rating: 3.0, favorite: false, cookTime: 40, difficulty: Difficulty.Easy, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Roasted Brussel Sprouts", rating: 4.0, favorite: false, cookTime: 40, difficulty: Difficulty.Easy, description: "this is a dummy description", videoLink: "emptyLink", imageString: "spaghetti-pie", ingredients: [FoodItem]())!, Recipe(name:"Vanilla Milk Shake", rating: 5, favorite: true, cookTime: 5, difficulty: Difficulty.Easy, description: "Using a blender or milkshake machine, blend all ingredients together until smooth. Serve in tall glass with straw.", videoLink: "https://www.youtube.com/watch?v=qK8UT1u59Qc", imageString: "milkshake", ingredients: [FoodItem(name: "Ice Cream", amount: "4 cups", days: 20)!, FoodItem(name: "Sugar", amount: "8 tbsp", days: 20)!, FoodItem(name: "Vanilla Extract", amount: "2 tsp", days: 20)!, FoodItem(name: "Milk", amount: "2 cups", days: 20)!])!, Recipe(name:"Shrimp Linguine", rating: 4.5, favorite: true, cookTime: 30, difficulty: Difficulty.Hard, description: "Drizzle some oil in a large pot of boiling salted water, add 1 tablespoon of salt and the linguine, and cook for 7 to 10 minutes, or according to the directions on the package. Meanwhile, in another large (12-inch), heavy-bottomed pan, melt the butter and olive oil over medium-low heat. Add the garlic. Saute for 1 minute. Be careful, the garlic burns easily! Add the shrimp, 1 1/2 teaspoons of salt, and the pepper and saute until the shrimp have just turned pink, about 5 minutes, stirring often. Remove from the heat, add the parsley, lemon zest, lemon juice, lemon slices, and red pepper flakes. Toss to combine. When the pasta is done, drain the cooked linguine and then put it back in the pot. Immediately add the shrimp and sauce, toss well, and serve.", videoLink: "https://www.youtube.com/watch?v=LHXBfEZ5z9c", imageString: "shrimp-linguine", ingredients: [FoodItem(name: "Salt", amount: "2 tbsp", days: 20)!, FoodItem(name: "Linguine", amount: "3/4 lbs", days: 20)!, FoodItem(name: "Butter", amount: "3 tbsp", days: 20)!, FoodItem(name: "Olive Oil", amount: "2.5 tbsp", days: 20)!, FoodItem(name: "Shrimp", amount: "16", days: 20)!, FoodItem(name: "Lemon", amount: ".5", days: 20)!, FoodItem(name: "Red Pepper Flakes", amount: ".125 tsp", days: 20)!, FoodItem(name: "Parsely Leaves", amount: "1/3 cup", days: 20)!, FoodItem(name: "Black Pepper", amount: ".25 tsp", days: 20)!]), Recipe(name:"Cheese Burger", rating: 4.0, favorite: true, cookTime: 20, difficulty: Difficulty.Medium, description: "1. In a medium bowl, combine cubed chuck roll, salt, black pepper, thyme, and sliced garlic. Stir to coat. Cover and refrigerate to cure overnight. 2. Prepare the sauce: in a small mixing bowl, combine the mayonnaise, ketchup, relish, vinegar, lemon juice, salt, and pepper. Whisk together. Refrigerate to bring flavors together. 3. Using a stand mixer fitted with meat grinder attachment, grind the cured meat, layering in pieces of chopped bacon throughout. (Ensure the meat and grinder attachments are very cold before grinding! Recommended that you place it in the freezer for a few minutes just before using.) 4. Lightly mix together the ground meat and then form into six, 3 ounce balls. 5. To a hot, oiled, cast iron skillet, over medium/high heat - add the balls and allow to cook slightly. Using two spatulas layered on top of one another, press down on the burger to form into thin patties. Continue to cook until the underside has browned and caramelized. 6. Flip the burgers and continue to cook until the second side just begins to brown. Top with cheese and remove from the skillet. 7. To assemble: Spread the burger sauce onto both halves of a toasted potato bun. On the bottom bun, layer lettuce, tomato, and a sprinkle of salt. Add one burger patty, thinly sliced onions, then the second burger patty. Place 4 pickles onto the top bun and place on top of the burger. Enjoy!", videoLink: "https://www.youtube.com/watch?v=C5Hq4mjMJQM", imageString: "cheeseburger", ingredients: [FoodItem(name: "Cheese", amount: ".5 lbs", days: 20)!, FoodItem(name: "Ground Beef", amount: "1 lb", days: 20)!, FoodItem(name: "Pickles", amount: "8", days: 20)!, FoodItem(name: "Tomatoes", amount: "2", days: 20)!, FoodItem(name: "Hamburger Buns", amount: "4", days: 20)!, FoodItem(name: "Fresh Thyme", amount: "1 tbsp", days: 20)!, FoodItem(name: "Black Pepper", amount: ".5 tbsp", days: 20)!, FoodItem(name: "Garlic", amount: "1 clove", days: 20)!, FoodItem(name: "Bacon", amount: ".5 lbs", days: 20)!, FoodItem(name: "lettuce", amount: ".5 lbs", days: 20)!])!]
    
    var inventoryItems = [FoodItem(name: "Cheese", amount: "2 lbs", days: 1)!, FoodItem(name: "Yogurt", amount: "0.5 gal", days: 3)!, FoodItem(name: "Milk", amount: "1 gal", days: 2)!, FoodItem(name: "Chicken", amount: "1.5 lbs", days: 4)!, FoodItem(name: "Apples", amount: "5", days: 5)!, FoodItem(name: "Oranges", amount: "8", days: 6)!, FoodItem(name: "Ketchup", amount: "16 oz", days: 8)!, FoodItem(name: "Mustard", amount: "10 oz", days: 14)!]
    
    func addInventoryItem(item: FoodItem) {
        self.inventoryItems.append(item)
    }
    
    func deleteInventoryItem(item: FoodItem) {
        for i in 0...self.inventoryItems.count - 1 {
            if self.inventoryItems[i] == item {
                print(self.inventoryItems[i].name + " and " + item.name + " to be removed")
                self.inventoryItems.remove(at: i)
                return
            }
        }
    }
    
    func editInventoryItem(newItem: FoodItem, oldItem: FoodItem) {
        for i in 0...self.inventoryItems.count - 1 {
            if self.inventoryItems[i] == oldItem {
                self.inventoryItems[i] = newItem
                return
            }
        }
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

extension FoodItem {
    static func == (left: FoodItem, right: FoodItem) -> Bool {
        return left.amount == right.amount && left.days == right.days && left.name == right.name
    }
}
