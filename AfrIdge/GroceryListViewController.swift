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
    var unchecked: [String] = ["milk", "eggs", "yogurt", "cheese"]
    var checked: [String] = ["chicken", "lettuce", "tomatoes"]
    var index = 0
    
    //Change which list is being displayed
    @IBAction func changeListFilter(_ sender: UISegmentedControl) {
        index = ticker.selectedSegmentIndex
        print(index)
        list.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(index == 0) {
            return(checked.count)
        }
        return(unchecked.count)
    }
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        if(index == 0) {
            cell.textLabel?.text = checked[indexPath.row]
        } else {
            cell.textLabel?.text = unchecked[indexPath.row]
        }
        return(cell)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("In Grocery List!")
    }
    
    
}

