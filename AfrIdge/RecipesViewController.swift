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
    @IBOutlet weak var sortPicker: UIPickerView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var recipeButton: UIButton!
    @IBOutlet weak var searchBar: UITextField!
    
    var favorites = Data.sharedData.favoritedRecipes
    var recipes = Data.sharedData.allRecipes
    var index = 0
    
    let sortData = ["Alphabetical", "Rating", "Cook Time", "Difficulty"]
    let recipeSegueIdentifier = "ShowRecipeDetailSegue"
    let selectedTabImg = UIImage(named: "tab selected")
    let unselectedTabImg = UIImage(named: "tab unselected")
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 7
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == recipeSegueIdentifier) {
            let destination = segue.destination as! RecipeDetailViewController
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
        let row = indexPath.section
        performSegue(withIdentifier: recipeSegueIdentifier, sender: row)
    }
    
    @IBAction func favoriteButtonClicked(_ sender: Any) {
        if index == 0 {
            return
        }
        index = 0
        favoriteButton.setBackgroundImage(selectedTabImg, for: .normal)
        recipeButton.setBackgroundImage(unselectedTabImg, for: .normal)
        
        //defaults dial back to alphabetical
        sortPicker.selectRow(0, inComponent: 0, animated: true)
        recipeList.reloadData()
    }
    
    @IBAction func recipeButtonClicked(_ sender: Any) {
        if index == 1 {
            return
        }
        index = 1
        recipeButton.setBackgroundImage(selectedTabImg, for: .normal)
        favoriteButton.setBackgroundImage(unselectedTabImg, for: .normal)
        
        //defaults dial back to alphabetical
        sortPicker.selectRow(0, inComponent: 0, animated: true)
        recipeList.reloadData()
        recipes.sort{$0.name <= $1.name}
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.sortPicker.dataSource = self
        self.sortPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {        
        //in case global data changed
        self.navigationController?.isNavigationBarHidden = true
        
        self.recipeList.separatorStyle = .none
        
        favorites = Data.sharedData.favoritedRecipes
        recipes = Data.sharedData.allRecipes
        
        recipeList.reloadData()
        favorites.sort{$0.name <= $1.name}
        recipes.sort{$0.name <= $1.name}
        sortPicker.selectRow(0, inComponent: 0, animated: false)
        
        print("In Recipes!")
    }
    
    //Return number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        if (index == 0) {
            return favorites.count
        } else {
            return recipes.count
        }
    }
    
    //Return number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
//        if(index == 0) {
//            return(favorites.count)
//        }
//        return(recipes.count)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    
    //Format and return cell for given row indexPath.row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let recipeCell = Bundle.main.loadNibNamed("RecipeTableViewCell", owner: self, options: nil)?.first as! RecipeTableViewCell
        
        var tempList = self.favorites
        
        if (index == 1) {
            tempList = recipes
        }
        
        recipeCell.recipeName.text = tempList[indexPath.section].name
        recipeCell.recipe = tempList[indexPath.section]
        
        recipeCell.layer.cornerRadius = 12
        recipeCell.layer.masksToBounds = true
        recipeCell.layer.borderWidth = 1
        recipeCell.layer.borderColor = UIColor.gray.cgColor
        
        
        //recipeCell.rating.text = String(recipes[indexPath.row].rating)
        
        return recipeCell
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
