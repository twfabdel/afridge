//
//  IngredientsTableViewCell.swift
//  AfrIdge
//
//  Created by Brian Rossi on 12/7/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {
    
    var delegate: RecipeDetailViewController?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.delegate = nil
    }

}
