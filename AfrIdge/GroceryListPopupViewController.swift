//
//  GroceryListPopupViewController.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/30/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class GroceryListPopupViewController: UIViewController {

    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var popUp: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var itemError: UILabel!
    @IBOutlet weak var amountError: UILabel!
    
    var itemID: [Int] = []
    var parentView: GroceryListViewController?
    var add = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        if add {
            self.header.text = "Add Item"
            self.doneBtn.setTitle("Add", for: .normal)
            self.doneBtn.layer.backgroundColor = #colorLiteral(red: 0.1224516258, green: 0.5630977154, blue: 0.009584950283, alpha: 1).cgColor
        }
        self.hideErrors()
    }
    
    func hideErrors() {
        self.itemError.isHidden = true
        self.amountError.isHidden = true
    }
    
    func setup() {
       self.view.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 0.5)
        self.popUp.layer.cornerRadius = 20
        self.popUp.layer.masksToBounds = true
        self.doneBtn.layer.cornerRadius = 10
        self.doneBtn.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

    @IBAction func cancel(_ sender: UIButton) {
        self.view.removeFromSuperview()
        self.parentView?.list.reloadData()
    }
    @IBAction func backgroundClose(_ sender: UIButton) {
        self.view.removeFromSuperview()
        self.parentView?.list.reloadData()
    }

    
    @IBAction func done(_ sender: Any) {
        self.hideErrors()
        let item = self.itemTextField.text
        let amount = self.amountTextField.text
        
        var errors = false
        if (item?.characters.count ?? 0) == 0 {
            self.itemError.isHidden = false
            errors = true
        }
        if (amount?.characters.count ?? 0) == 0 {
            self.amountError.isHidden = false
            errors = true
        }
        if errors {
            return
        }
        
        if add {
            self.parentView?.addItem(food: self.itemTextField.text!, amount: self.amountTextField.text!)
        } else {
            self.parentView?.editItem(itemID: self.itemID, food: self.itemTextField.text!, amount: self.amountTextField.text!)
        }
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
