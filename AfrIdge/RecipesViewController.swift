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
    
    var favorites = [Recipe]()
    var recipes = [Recipe]()
    var sortData = ["Alphabetical", "Rating", "Cook Time", "Difficulty"]
    var index = 0
    
    @IBAction func changeRecipeListFilter(_ sender: UISegmentedControl) {
        index = ticker.selectedSegmentIndex
        recipeList.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sortPicker.dataSource = self;
        self.sortPicker.delegate = self;
        initializeLists()
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
        if(index == 0) {
            return(favorites.count)
        }
        return(recipes.count)
    }
    
    //Format and return cell for given row indexPath.row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let recipeCell = Bundle.main.loadNibNamed("RecipeTableViewCell", owner: self, options: nil)?.first as! RecipeTableViewCell
        
        var tempList = self.favorites
        
        if (index == 1) {
            tempList = recipes
        }
        
        recipeCell.recipeName.text = tempList[indexPath.row].name
        //recipeCell.rating.text = String(recipes[indexPath.row].rating)
        
        return(recipeCell)
    }
    
    //for sortPicker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    //for sortPicker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sortData.count;
    }
    
    //for displaying info in sortPicker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sortData[row];
    }
    
    //if new sort type is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (row == 0) {
            //sort list by alphabetical
            self.view.backgroundColor = UIColor.orange;
        } else if (row == 1) {
            //sort list by rating
            self.view.backgroundColor = UIColor.blue;
        } else if (row == 2) {
            //sort list by cook time
            self.view.backgroundColor = UIColor.red;
        } else {
            //sort list by difficulty
            self.view.backgroundColor = UIColor.green;
        }
    }
    
    func initializeLists() {
        favorites.append(Recipe(name:"Vanilla Milk Shake", rating: 5, favorite: true, cookTime: 10, difficulty: Difficulty.Easy, videoLink: "emptyLink", ingredients: [FoodItem]())!)
        favorites.append(Recipe(name:"Shrimp Linguini", rating: 4.5, favorite: true, cookTime: 40, difficulty: Difficulty.Hard, videoLink: "emptyLink", ingredients: [FoodItem]())!)
        favorites.append(Recipe(name:"Cheese Burger", rating: 4.0, favorite: true, cookTime: 20, difficulty: Difficulty.Medium, videoLink: "emptyLink", ingredients: [FoodItem]())!)
        
        recipes.append(Recipe(name:"Chicken Marsala", rating: 4.5, favorite: false, cookTime: 40, difficulty: Difficulty.Medium, videoLink: "emptyLink", ingredients: [FoodItem]())!)
        recipes.append(Recipe(name:"Chicken Parm", rating: 2.5, favorite: false, cookTime: 40, difficulty: Difficulty.Medium, videoLink: "emptyLink", ingredients: [FoodItem]())!)
        recipes.append(Recipe(name:"Southwestern Scramble", rating: 3.0, favorite: false, cookTime: 40, difficulty: Difficulty.Easy, videoLink: "emptyLink", ingredients: [FoodItem]())!)
        recipes.append(Recipe(name:"Roasted Brussel Sprouts", rating: 4.0, favorite: false, cookTime: 40, difficulty: Difficulty.Easy, videoLink: "emptyLink", ingredients: [FoodItem]())!)
        recipes.append(Recipe(name:"Tofu Sautee", rating: 3.5, favorite: false, cookTime: 40, difficulty: Difficulty.Medium, videoLink: "emptyLink", ingredients: [FoodItem]())!)
        
    }
    
    
}
