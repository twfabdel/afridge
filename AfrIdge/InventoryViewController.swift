//
//  InventoryViewController.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/18/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var items = [FoodItem]()
    var filteredItems: [FoodItem] = []

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var colorStrip: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.colorStrip.layer.cornerRadius = 10
        self.colorStrip.layer.masksToBounds = true
        self.navigationController?.isNavigationBarHidden = true
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.hideKeyboard()
    }
    
    func fetchItems() {
        Data.sharedData.inventoryItems.sort{$0.name.lowercased() <= $1.name.lowercased()}
        self.items = Data.sharedData.inventoryItems
        self.filterFunction()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.searchBar.text = ""
        self.fetchItems()
    }
    
    @IBAction func clearSearch(_ sender: UIButton) {
        self.searchBar.text = ""
        self.filteredItems = items
        self.collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredItems.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inventoryCell", for: indexPath) as! InventoryCollectionViewCell
        
        cell.delegate = self
    
        cell.itemImageButton.layer.cornerRadius = cell.itemImageButton.frame.size.width / 2

        cell.itemImageButton.layer.masksToBounds = true
        
        if indexPath.row == 0 {
            cell.itemImageButton.setImage(UIImage(named:"add_inventory"), for: .normal)
            cell.name.text = "New Item"
            cell.itemImageButton.layer.borderWidth = 0
            cell.isNewItemCell = true
            return cell
        }
        
        let i = indexPath.row - 1
        
        let food = filteredItems[i]
        cell.isNewItemCell = false
        cell.configureCell(foodItem: food, index: i)
        
        cell.itemImageButton.layer.borderWidth = cell.itemImageButton.frame.size.width / 15
        cell.itemImageButton.layer.borderColor = getBorderColor(food: food)

        return cell
    }
    
    func getBorderColor(food: FoodItem) -> CGColor {
        switch(food.days) {
            case 0, 1:
                return #colorLiteral(red: 0.9805763364, green: 0.3403144777, blue: 0.1325740814, alpha: 1).cgColor
            case 2:
                return #colorLiteral(red: 0.9822408557, green: 0.4477022886, blue: 0.1524676085, alpha: 1).cgColor
            case 3:
                return #colorLiteral(red: 0.9860967994, green: 0.6185792685, blue: 0.1775469184, alpha: 1).cgColor
            case 4:
                return #colorLiteral(red: 0.9921967387, green: 0.806186378, blue: 0.2091829181, alpha: 1).cgColor
            case 5:
                return #colorLiteral(red: 0.996211946, green: 0.9041512609, blue: 0.2206585109, alpha: 1).cgColor
            case 6, 7:
                return #colorLiteral(red: 0.9446939826, green: 0.9233725071, blue: 0.244337827, alpha: 1).cgColor
            case 8, 9:
                return #colorLiteral(red: 0.8280895352, green: 0.8991128802, blue: 0.2609015703, alpha: 1).cgColor
            case 10...12:
                return #colorLiteral(red: 0.6154962182, green: 0.7919276357, blue: 0.2834175825, alpha: 1).cgColor
            default:
                return #colorLiteral(red: 0.3027163148, green: 0.6845176816, blue: 0.3139420152, alpha: 1).cgColor
        }
    }

    @IBAction func filter(_ sender: Any) {
        self.filterFunction()
    }
    func filterFunction() {
        let str = self.searchBar.text
        if (str?.characters.count ?? 0) == 0{
            //Empty searchbar, show everything
            self.filteredItems = self.items
        } else {
            self.filteredItems = self.items.filter({$0.name.lowercased().range(of: str!.lowercased()) != nil})
            
        }
        collectionView.reloadData()
    }
    
    func showDetailPopup(cell: InventoryCollectionViewCell) {
        
        let popUp = UIStoryboard(name: "Inventory", bundle: nil).instantiateViewController(withIdentifier: "inventoryDetailPopup") as! InventoryDetailPopupViewController
        
        popUp.foodItem = cell.food
        popUp.listIndex = cell.listIndex
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController: self)
        
        popUp.parentView = self
    }
    
    func addItemToGrocery(name: String, amount: String) {
        Data.sharedData.addInventoryItemToGrocery(name: name, amount: amount)
    }
    
    func showAddItemPopup() {
        let popUp = UIStoryboard(name: "Inventory", bundle: nil).instantiateViewController(withIdentifier: "addItemPopup") as! NewItemPopupViewController
        
        self.addChildViewController(popUp)
        popUp.view.frame = self.view.frame
        self.view.addSubview(popUp.view)
        popUp.didMove(toParentViewController: self)
        
        popUp.parentView = self
    }
    
    func addItem(item: FoodItem) {
        Data.sharedData.inventoryItems.append(item)
        self.fetchItems()
        self.collectionView.reloadData()
    }
    
    func editItem(item: FoodItem, index: Int) {
        Data.sharedData.inventoryItems[index] = item
        self.fetchItems()
        self.collectionView.reloadData()
    }
}

