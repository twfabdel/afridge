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
    @IBOutlet weak var itemImageButton: UIButton!
    var delegate: InventoryViewController?
    var food: FoodItem?
    var isNewItemCell: Bool = false
    var listIndex: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(foodItem: FoodItem, index: Int) {
        self.listIndex = index
        self.food = foodItem
        self.name.text = self.food!.name
        
        let img = UIImage(named: self.food!.name)
        if img != nil {
            self.itemImageButton.setImage(img, for: .normal)
        } else {
            self.itemImageButton.setImage(#imageLiteral(resourceName: "question_mark"), for: .normal)
        }
        
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
