//
//  GroceryListViewController.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/18/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class GroceryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{


    @IBOutlet weak var list: UITableView!
    @IBOutlet weak var ticker: UISegmentedControl!
    
    var unchecked = [GroceryListItem]()
    var checked = [GroceryListItem]()
    var index = 0
    
    //Change which list is being displayed
    @IBAction func changeListFilter(_ sender: UISegmentedControl) {
        index = ticker.selectedSegmentIndex
        list.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(index == 0) {
            return(unchecked.count)
        }
        return(checked.count)
    }
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell = Bundle.main.loadNibNamed("ListItemTableViewCell", owner: self, options: nil)?.first as! ListItemTableViewCell
        
        var tempList = self.unchecked
        if(index == 1) {
            tempList = self.checked
        }
        cell.ListItemLabel.text = tempList[indexPath.row].food
        cell.ListItemAmount.text = tempList[indexPath.row].amount

        return(cell)
    }
    
    func loadInitialCells() {
        unchecked.append(GroceryListItem(food: "milk", amount: "1 gal", state: false)!)
        unchecked.append(GroceryListItem(food: "eggs", amount: "12", state: false)!)
        unchecked.append(GroceryListItem(food: "cheese", amount: "0.5 lbs", state: false)!)
        unchecked.append(GroceryListItem(food: "yogurt", amount: "0.25 gal", state: false)!)
        unchecked.append(GroceryListItem(food: "chicken", amount: "2.5 lbs", state: false)!)
        checked.append(GroceryListItem(food: "tomatoes", amount: "5", state: true)!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadInitialCells()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("In Grocery List!")
    }
    
    
}

