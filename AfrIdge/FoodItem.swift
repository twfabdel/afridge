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
    //what to make amount type?
    var amount: Int
    
    init?(name: String, amount: Int) {
        self.name = name
        self.amount = amount
        
        if name.isEmpty {
            return nil;
        }
    }
}
