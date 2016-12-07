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
    //@IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemImageButton: UIButton!
    var delegate: InventoryViewController?
    var food: FoodItem?
    var isNewItemCell: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

    @IBAction func foodClicked(_ sender: UIButton) {
        if self.isNewItemCell {
            self.delegate?.showAddItemPopup()
        } else {
            self.delegate?.showDetailPopup(cell: self)
        }
    }
}
