//
//  ListItemTableViewCell.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/19/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class ListItemTableViewCell: UITableViewCell {
    @IBOutlet weak var ListItemLabel: UILabel!
    @IBOutlet weak var ListItemAmount: UILabel!
    @IBOutlet weak var checkbox: UIButton!
    @IBOutlet weak var imgView: UIImageView!
   
    var delegate: GroceryListViewController?
    var isChecked = false

    @IBAction func checkClicked(_ sender: UIButton) {
        self.delegate?.boxClicked(cell: self)
        isChecked = !isChecked
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.delegate = nil
    }
   
}
