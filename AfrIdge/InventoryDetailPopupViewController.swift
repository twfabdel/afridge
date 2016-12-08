//
//  InventoryDetailPopupViewController.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 12/6/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class InventoryDetailPopupViewController: UIViewController {
    @IBOutlet weak var popUp: UIView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var amountLeft: UILabel!
    @IBOutlet weak var daysLeft: UILabel!
    @IBOutlet weak var recipesBtn: UIButton!
    @IBOutlet weak var addToGroceryBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 0.5)
        self.popUp.layer.cornerRadius = 20
        self.popUp.layer.masksToBounds = true
        
        self.recipesBtn.layer.cornerRadius = 10
        self.recipesBtn.layer.masksToBounds = true
        
        self.addToGroceryBtn.layer.cornerRadius = 10
        self.addToGroceryBtn.layer.masksToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backgroundClose(_ sender: UIButton) {
        self.view.removeFromSuperview()
    }
    @IBAction func closePopup(_ sender: UIButton) {
        self.view.removeFromSuperview()
    }
   
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
