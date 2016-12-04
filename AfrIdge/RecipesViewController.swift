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
    
    var favorites = Data.sharedData.favoritedRecipes
    var recipes = Data.sharedData.unfavoritedRecipes
    var sortData = ["Alphabetical", "Rating", "Cook Time", "Difficulty"]
    var index = 0
    let recipeSegueIdentifier = "ShowRecipeDetailSegue"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == recipeSegueIdentifier) {
            let destination = segue.destination as! RecipeDetailViewController
            //let tableIndex = recipeList.indexPathForSelectedRow?.row
            let tableIndex = sender as! Int
    
            if (index == 0) {
                destination.curRecipe = favorites[tableIndex]
            } else {
                destination.curRecipe = recipes[tableIndex]
            }
        }
     }
    
    //used to force a segue to recipe detail view when a cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        performSegue(withIdentifier: recipeSegueIdentifier, sender: row)
    }
    
    @IBAction func changeRecipeListFilter(_ sender: UISegmentedControl) {
        index = ticker.selectedSegmentIndex
        
        //sort new list alphabetically
        if (index == 0) {
            //switching to favorites list
            favorites.sort{$0.name <= $1.name}
        } else {
            //switching to recipes list
            recipes.sort{$0.name <= $1.name}
        }
        
        //defaults dial back to alphabetical
        sortPicker.selectRow(0, inComponent: 0, animated: true)
        
        recipeList.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sortPicker.dataSource = self
        self.sortPicker.delegate = self
        
        favorites.sort{$0.name <= $1.name}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
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
        recipeCell.recipe = tempList[indexPath.row]
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
        var tempRecipeList = favorites
        if (index == 1) {
            tempRecipeList = recipes
        }
        if (row == 0) {
            //sort list by alphabetical
            tempRecipeList.sort{$0.name <= $1.name}
        } else if (row == 1) {
            //sort list by rating
            tempRecipeList.sort{$0.rating >= $1.rating}
        } else if (row == 2) {
            //sort list by cook time
            tempRecipeList.sort{$0.cookTime <= $1.cookTime}
        } else {
            //sort list by difficulty
            tempRecipeList.sort{$0.difficulty.toSort() <= $1.difficulty.toSort()}
        }
        
        if (index == 0) {
            favorites = tempRecipeList
        } else {
            recipes = tempRecipeList
        }
        
        recipeList.reloadData()
    }
    
    
}
