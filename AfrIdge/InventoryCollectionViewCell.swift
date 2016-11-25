//
//  InventoryCollectionViewCell.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/24/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class InventoryCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

}
