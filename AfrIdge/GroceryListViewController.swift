//
//  GroceryListViewController.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/18/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class GroceryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate{


    @IBOutlet weak var list: UITableView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var toBuyBtn: UIButton!
    @IBOutlet weak var boughtBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    
    var unchecked = [GroceryListItem]()
    var checked = [GroceryListItem]()
    var index = 0
    
    let selectedTabImg = UIImage(named: "tab selected")
    let unselectedTabImg = UIImage(named: "tab unselected")
    
    @IBAction func changeFilterToBuy(_ sender: UIButton) {
        if index == 0 {
            return
        }
        index = 0
        self.toBuyBtn.setBackgroundImage(selectedTabImg, for: .normal)
        self.boughtBtn.setBackgroundImage(unselectedTabImg, for: .normal)
        self.doneBtn.isHidden = true
        list.reloadData()
    }
    
    @IBAction func changeFilterBought(_ sender: UIButton) {
        if index == 1 {
            return
        }
        index = 1
        self.boughtBtn.setBackgroundImage(selectedTabImg, for: .normal)
        self.toBuyBtn.setBackgroundImage(unselectedTabImg, for: .normal)
        if self.checked.count > 0 {
            self.doneBtn.isHidden = false
        }
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
        
        let imgStr = tempList[indexPath.row].food + " icon"
        let img = UIImage(named: imgStr)
        if (img != nil) {
            cell.imgView?.image = img
        }
        
        cell.selectionStyle = .none
        
        let lpg = UILongPressGestureRecognizer(target: self, action: #selector(GroceryListViewController.longPressAction))
        lpg.minimumPressDuration = 2
        cell.addGestureRecognizer(lpg)

        return(cell)
    }
    
    func longPressAction(sender: UILongPressGestureRecognizer) {
        let pressLocation = sender.location(in: self.list)
        let indexPath = self.list.indexPathForRow(at: pressLocation)
        let cell = self.list.cellForRow(at: indexPath!) as! ListItemTableViewCell
        print(cell.ListItemLabel.text!)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") {
            (action, indexPath) -> Void in
            
            if self.index == 0 {
                Data.sharedData.deleteItem(index: indexPath.row, isChecked: false)
            } else {
                Data.sharedData.deleteItem(index: indexPath.row, isChecked: true)
                if self.checked.count == 0 {
                    self.doneBtn.isHidden = true
                }
            }
            self.fetchData()
        }
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") {
            (action, indexPath) -> Void in
            var foodItem: GroceryListItem
            var id: [Int]
            if self.index == 0 {
                foodItem = self.unchecked[indexPath.row]
                id = [0, indexPath.row]
                print("Edit " + foodItem.food)
            } else {
                foodItem = self.checked[indexPath.row]
                id = [1, indexPath.row]
                print("Edit " + foodItem.food)
            }
            
            
            let popUp = UIStoryboard(name: "GroceryList", bundle: nil).instantiateViewController(withIdentifier: "groceryPopUp") as! GroceryListPopupViewController
            popUp.add = false
            
            self.addChildViewController(popUp)
            popUp.view.frame = self.view.frame
            self.view.addSubview(popUp.view)
            popUp.didMove(toParentViewController: self)
            
            popUp.itemID = id
            popUp.parentView = self
            popUp.itemTextField.text = foodItem.food
            popUp.amountTextField.text = foodItem.amount
            
        }
        edit.backgroundColor = UIColor(colorLiteralRed: 69.0/255.0, green: 133.0/255.0, blue: 189.0/255.0, alpha: 1.0)
        
        return [delete, edit]
    }
    
    @IBAction func showDoneShoppingPopUp(_ sender: UIButton) {
        let popUp = UIStoryboard(name: "GroceryList", bundle: nil).instantiateViewController(withIdentifier: "doneShoppingPopUp") as! DoneShoppingViewController
        
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController: self)
        
        popUp.boughtItems = self.checked
    }
    
    @IBAction func showAddItemPopup(_ sender: UIButton) {
        
        let popUp = UIStoryboard(name: "GroceryList", bundle: nil).instantiateViewController(withIdentifier: "groceryPopUp") as! GroceryListPopupViewController
        popUp.add = true
        
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController: self)
        
        popUp.parentView = self
    }
    
    func editItem(itemID: [Int], food: String, amount: String) {
        let index = itemID[1]
        if itemID[0] == 0 {
            Data.sharedData.editItem(index: index, isChecked: false, food: food, amount: amount)
        } else {
            Data.sharedData.editItem(index: index, isChecked: true, food: food, amount: amount)
        }
        self.fetchData()
    }
    
    func addItem(food: String, amount: String) {
        let newItem = GroceryListItem(food: food, amount: amount, isChecked: false)
        Data.sharedData.addItem(item: newItem!)
        self.fetchData()
    }
    
    func boxClicked(cell: ListItemTableViewCell) {
        let index = self.list.indexPath(for: cell)!.row
        
        if(cell.isChecked) {
            Data.sharedData.uncheckItem(index: index)
        } else {
            Data.sharedData.checkItem(index: index)
        }
        self.fetchData()
        if self.checked.count == 0 {
            self.doneBtn.isHidden = true
        }
    }
    
    func fetchData() {
        self.unchecked = Data.sharedData.toBuy
        self.checked = Data.sharedData.bought
        self.list.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        self.toBuyBtn.adjustsImageWhenHighlighted = false
        self.boughtBtn.adjustsImageWhenHighlighted = false
        self.doneBtn.layer.cornerRadius = 15

        self.doneBtn.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.fetchData()
    }
}

