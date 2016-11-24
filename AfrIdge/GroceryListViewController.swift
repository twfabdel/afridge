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
    
    //Return number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(index == 0) {
            return(unchecked.count)
        }
        return(checked.count)
    }
 
    //Format and return cell for given row indexPath.row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell = Bundle.main.loadNibNamed("ListItemTableViewCell", owner: self, options: nil)?.first as! ListItemTableViewCell
        cell.delegate = self
        
        var tempList = self.unchecked
        cell.isChecked = false
        
        if(index == 1) {
            tempList = self.checked
            cell.isChecked = true
            cell.checkbox.setImage(UIImage(named: "checkbox_t") as UIImage?, for: .normal)
        }
        
        cell.ListItemLabel.text = tempList[indexPath.row].food
        cell.ListItemAmount.text = tempList[indexPath.row].amount
        
        cell.selectionStyle = .none

        return(cell)
    }
    
    func boxClicked(cell: ListItemTableViewCell) {
        let index = self.list.indexPath(for: cell)!.row
        print("Button tapped on row \(index)")
        
        if(cell.isChecked) {
            print("was Checked")
            let listItem = checked[index]
            checked.remove(at: index)
            unchecked.append(listItem)
            
        } else {
            print("wasn't checked")
            let listItem = unchecked[index]
            unchecked.remove(at: index)
            checked.append(listItem)
        }
        list.reloadData()
    }
    
    //Load hardcoded data
    func loadInitialCells() {
        unchecked.append(GroceryListItem(food: "milk", amount: "1 gal", isChecked: false)!)
        unchecked.append(GroceryListItem(food: "eggs", amount: "12", isChecked: false)!)
        unchecked.append(GroceryListItem(food: "cheese", amount: "0.5 lbs", isChecked: false)!)
        unchecked.append(GroceryListItem(food: "yogurt", amount: "0.25 gal", isChecked: false)!)
        unchecked.append(GroceryListItem(food: "chicken", amount: "2.5 lbs", isChecked: false)!)
        checked.append(GroceryListItem(food: "tomatoes", amount: "5", isChecked: true)!)
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

