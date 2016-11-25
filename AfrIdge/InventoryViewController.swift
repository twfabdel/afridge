//
//  InventoryViewController.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/18/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var items = ["Cheese", "Yogurt", "Milk", "Chicken", "Apples", "Oranges", "Ketchup", "Mustard"]
    var filteredItems: [String] = []

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        items.sort()
        self.filteredItems = self.items
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("In Inventory!")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inventoryCell", for: indexPath) as! InventoryCollectionViewCell
    
        cell.itemImageView.image = UIImage(named: "spaghetti-pie")
        cell.itemImageView.layer.cornerRadius = cell.itemImageView.frame.size.width / 2

        cell.itemImageView.layer.masksToBounds = true
        
        cell.itemImageView.layer.borderWidth = cell.itemImageView.frame.size.width / 15
        cell.itemImageView.layer.borderColor = getBorderColor()
        
        cell.name.text = filteredItems[indexPath.row]

        return cell
    }
    
    func getBorderColor() -> CGColor {
        return UIColor.red.cgColor
    }

    @IBAction func filter(_ sender: Any) {
        let str = self.searchBar.text
        if (str?.characters.count ?? 0) == 0{
            //Empty searchbar, show everything
            self.filteredItems = self.items
        } else {
            self.filteredItems = ["filtered", "filtered"]
        }
        collectionView.reloadData()
    }

}

