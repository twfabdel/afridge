//
//  DoneShoppingViewController.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 12/2/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class DoneShoppingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var popUp: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var list: UITableView!
    
    var boughtItems: [GroceryListItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 0.5)
        self.popUp.layer.cornerRadius = 20
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.boughtItems.count
    }
    
    //Format and return cell for given row indexPath.row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("ListItemTableViewCell", owner: self, options: nil)?.first as! ListItemTableViewCell
        
        cell.checkbox.isHidden = true
        
        cell.ListItemLabel.text = self.boughtItems[indexPath.row].food
        cell.ListItemAmount.text = self.boughtItems[indexPath.row].amount
        
        let imgStr = self.boughtItems[indexPath.row].food + " icon"
        let img = UIImage(named: imgStr)
        if (img != nil) {
            cell.imgView?.image = img
        }
        
        cell.selectionStyle = .none
    
        return cell
    }

}
