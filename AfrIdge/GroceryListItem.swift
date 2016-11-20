//
//  GroceryListItem.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/19/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import Foundation

class GroceryListItem {
    var food: String
    var amount: String
    var isChecked: Bool
    
    init?(food: String, amount: String, isChecked: Bool) {
        // Initialize stored properties.
        self.food = food
        self.amount = amount
        self.isChecked = isChecked
        
        // Initialization should fail if there is no name or if the rating is negative.
        if food.isEmpty || amount.isEmpty {
            return nil
        }
    }
}
