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
    @IBOutlet weak var viewButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Called when view button is clicked
    @IBAction func viewButtonClicked(_ sender: Any) {
        //go to recipe view for this specific recipe
        print("clicking view button in recipes")
    }
}
