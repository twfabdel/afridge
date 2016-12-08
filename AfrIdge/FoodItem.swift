//
//  FoodItem.swift
//  AfrIdge
//
//  Created by Brian Rossi on 11/29/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import Foundation

class FoodItem {
    
    var name: String
    var amount: String
    var days: Int
    
    init?(name: String, amount: String, days: Int) {
        self.name = name
        self.amount = amount
        self.days = days
        
        if name.isEmpty {
            return nil;
        }
    }
}
