//
//  RecipesViewController.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/18/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,
        UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var recipeList: UITableView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var ticker: UISegmentedControl!
    @IBOutlet weak var sortPicker: UIPickerView!
    
    var recipes = [Recipe]();
    var favorites = [String]();
    var sortData = ["Alphabetical", "Rating", "Cook Time", "Difficulty"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sortPicker.dataSource = self;
        self.sortPicker.delegate = self;
        initializeLists()
    }
    
    func initializeLists() {
        recipes.append(Recipe(name:"Chicken Marsala", rating: 4.5, favorite: false, cookTime: 40, videoLink: "emptyLink", ingredients: [String: Int]())!)
        recipes.append(Recipe(name:"Chicken Parm", rating: 2.5, favorite: false, cookTime: 40, videoLink: "emptyLink", ingredients: [String: Int]())!)
        recipes.append(Recipe(name:"Southwestern Scramble", rating: 3.0, favorite: false, cookTime: 40, videoLink: "emptyLink", ingredients: [String: Int]())!)
        recipes.append(Recipe(name:"Roasted Brussel Sprouts", rating: 4.0, favorite: false, cookTime: 40, videoLink: "emptyLink", ingredients: [String: Int]())!)
        recipes.append(Recipe(name:"Tofu Sautee", rating: 3.5, favorite: false, cookTime: 40, videoLink: "emptyLink", ingredients: [String: Int]())!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("In Recipes!")
    }
    
    //Return number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(recipes.count)
    }
    
    //Format and return cell for given row indexPath.row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let recipeCell = Bundle.main.loadNibNamed("RecipeTableViewCell", owner: self, options: nil)?.first as! RecipeTableViewCell
        
        recipeCell.recipeName.text = recipes[indexPath.row].name
        //recipeCell.rating.text = String(recipes[indexPath.row].rating)
        
        return(recipeCell)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sortData.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sortData[row];
    }
    
    
}
