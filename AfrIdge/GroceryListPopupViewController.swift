//
//  GroceryListPopupViewController.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/30/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class GroceryListPopupViewController: UIViewController {

    @IBOutlet weak var popUp: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    
    var itemID: [Int] = []
    var parentView: GroceryListViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
       self.view.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 0.5)
        self.popUp.layer.cornerRadius = 20
        
        
        //let lineColor = UIColor(colorLiteralRed: 0, green: 125.0/225.0, blue: 1, alpha: 1)
        let lineColor = UIColor.gray

        let line1 = UIView(frame: CGRect(x: 0, y: 0, width: cancelBtn.frame.size.width, height: 0.5))
        line1.backgroundColor = lineColor
        doneBtn.addSubview(line1)
        
        let line2 = UIView(frame: CGRect(x: 0, y: 0, width: doneBtn.frame.size.width, height: 0.5))
        line2.backgroundColor = lineColor
        cancelBtn.addSubview(line2)
        
        let line3 = UIView(frame: CGRect(x: 0, y: 0, width: 0.5, height: doneBtn.frame.size.height))
        line3.backgroundColor = lineColor
        doneBtn.addSubview(line3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

    @IBAction func cancel(_ sender: UIButton) {
        self.view.removeFromSuperview()
    }
    
    @IBAction func done(_ sender: Any) {
        self.parentView?.editItem(itemID: self.itemID, food: self.itemTextField.text!, amount: self.amountTextField.text!)
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
