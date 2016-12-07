//
//  RecipeTableViewCell.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/21/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    
    var delegate: RecipesViewController?
    var recipe: Recipe!
    
    let recipeSegueIdentifier = "ShowRecipeSegue"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
