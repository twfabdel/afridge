//
//  RecipesViewController.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/18/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//,UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var recipeList: UITableView!
    @IBOutlet weak var sortPicker: UIPickerView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var recipeButton: UIButton!
    @IBOutlet weak var searchBar: UITextField!
    
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var dropDownTableView: UITableView!
    
    
    var favorites = Data.sharedData.favoritedRecipes
    var recipes = Data.sharedData.allRecipes
    var index = 0
    var dropDownActive = false
    
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
    
    //used to force a segue to recipe detail view or to sort list depending on which table is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == recipeList {
            tableView.deselectRow(at: indexPath, animated: true)
            let row = indexPath.section
            performSegue(withIdentifier: recipeSegueIdentifier, sender: row)
        } else {
            let row = indexPath.row
            var tempRecipeList = favorites
            if (index == 1) {
                tempRecipeList = recipes
            }
            if (row == 0) {
                //sort list by alphabetical
                tempRecipeList.sort{$0.name <= $1.name}
                dropDownButton.setTitle("Sorted Alphabeticaly", for: .normal)
            } else if (row == 1) {
                //sort list by rating
                tempRecipeList.sort{$0.rating >= $1.rating}
                dropDownButton.setTitle("Sorted by Rating", for: .normal)
            } else if (row == 2) {
                //sort list by cook time
                tempRecipeList.sort{$0.cookTime <= $1.cookTime}
                dropDownButton.setTitle("Sorted by Cook Time", for: .normal)
            } else {
                //sort list by difficulty
                tempRecipeList.sort{$0.difficulty.toSort() <= $1.difficulty.toSort()}
                dropDownButton.setTitle("Sorted by Difficulty", for: .normal)
            }
            
            dropDownTableView.isHidden = true
            dropDownActive = false
            
            if (index == 0) {
                favorites = tempRecipeList
            } else {
                recipes = tempRecipeList
            }
                    
            recipeList.reloadData()
        }
    }
    
    @IBAction func favoriteButtonClicked(_ sender: Any) {
        if index == 0 {
            return
        }
        index = 0
        favoriteButton.setBackgroundImage(selectedTabImg, for: .normal)
        recipeButton.setBackgroundImage(unselectedTabImg, for: .normal)
        
        //defaults dial back to alphabetical
        dropDownButton.setTitle("Sort recipe by...", for: .normal)
        dropDownTableView.isHidden = true
        recipeList.reloadData()
        favorites.sort{$0.name <= $1.name}
        dropDownTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        dropDownActive = false
    }
    
    @IBAction func recipeButtonClicked(_ sender: Any) {
        if index == 1 {
            return
        }
        index = 1
        recipeButton.setBackgroundImage(selectedTabImg, for: .normal)
        favoriteButton.setBackgroundImage(unselectedTabImg, for: .normal)
        
        //defaults dial back to alphabetical
        dropDownButton.setTitle("Sort recipe by...", for: .normal)
        dropDownTableView.isHidden = true
        recipeList.reloadData()
        recipes.sort{$0.name <= $1.name}
        dropDownTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        dropDownActive = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        
        dropDownButton.setTitle("Sort recipe by...", for: .normal)
        dropDownButton.layer.cornerRadius = 7
        dropDownButton.layer.masksToBounds = true
        dropDownButton.layer.borderColor = UIColor.black.cgColor
        dropDownButton.layer.borderWidth = 1
        
        dropDownTableView.isHidden = true
        dropDownTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        dropDownTableView.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        print("In Recipes!")
    }
    
    //Return number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == recipeList {
            if (index == 0) {
                return favorites.count
            } else {
                return recipes.count
            }
        } else {
            return 1
        }
    }
    
    //Return number of rows per section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == recipeList {
            return 1
        } else {
            return sortData.count
        }

    }
    
    //return spacing between cells in table view
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == recipeList {
            return cellSpacingHeight
        } else {
            return 0
        }
    }
    
    //set background for spacing between cells in table view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == recipeList {
            let headerView = UIView()
            headerView.backgroundColor = UIColor.clear
            return headerView
        } else {
            return nil
        }
    }
    
    //set height for cells in table view
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == recipeList {
            return 100.0
        } else {
            return 25.0
        }
    }
    
    
    //Format and return cell for given row indexPath.row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == recipeList {
            let recipeCell = Bundle.main.loadNibNamed("RecipeTableViewCell", owner: self, options: nil)?.first as! RecipeTableViewCell
        
            var tempList = self.favorites
        
            if (index == 1) {
                tempList = recipes
            }
        
            let curRecipe = tempList[indexPath.section]
        
            recipeCell.recipeName.text = curRecipe.name
            recipeCell.recipe = curRecipe
            recipeCell.recipeImage.image = UIImage(named: curRecipe.imageString)
        
            recipeCell.layer.cornerRadius = 12
            recipeCell.layer.masksToBounds = true
            recipeCell.layer.borderWidth = 1
            recipeCell.layer.borderColor = UIColor.gray.cgColor
        
            return recipeCell
        } else {
            // TODO!!! DropDownTableViewCell
            
            let cell = Bundle.main.loadNibNamed("DropDownTableViewCell", owner: self, options: nil)?.first as! DropDownTableViewCell
            cell.textLabel?.text = sortData[indexPath.row]
            cell.textLabel?.textAlignment = NSTextAlignment.center
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            let bgView = UIView()
            bgView.backgroundColor = #colorLiteral(red: 0.2695342898, green: 0.5220056176, blue: 0.7386800647, alpha: 1)
            cell.selectedBackgroundView = bgView
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            
            return cell
            
        }
    }
    
    @IBAction func dropDownClicked(_ sender: Any) {
        if dropDownActive {
            dropDownTableView.isHidden = true
            dropDownActive = false
        } else {
            dropDownTableView.isHidden = false
            dropDownActive = true
        }
    }
    

    
    
}
