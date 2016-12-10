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
    @IBOutlet weak var dropDownIcon: UIImageView!
    
    var favorites = [Recipe]()
    var recipes = [Recipe]()
    var filteredRecipes = [Recipe]()
    var filteredFavorites = [Recipe]()
    var index = 0
    var dropDownActive = false
    var searchStr = ""
    var comingFromInventory = false
    
    let sortData = ["Alphabetical", "Rating", "Cook Time", "Difficulty"]
    let recipeSegueIdentifier = "ShowRecipeDetailSegue"
    let selectedTabImg = UIImage(named: "tab selected")
    let unselectedTabImg = UIImage(named: "tab unselected")
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 7
    
    
    @IBAction func clearSearch(_ sender: UIButton) {
        self.searchBar.text = ""
        self.filter()
    }
    
    @IBAction func filterRecipes(_ sender: Any) {
        filter()
    }
    
    func filter() {
        let str = self.searchBar.text
        if (str?.characters.count ?? 0) == 0{
            //Empty searchbar, show everything
            if index == 0 {
                self.filteredFavorites = self.favorites
            } else {
                self.filteredRecipes = self.recipes
            }
        } else {
            if index == 0 {
                self.filteredFavorites = self.favorites.filter({self.containsItem(recipe: $0, str: str!)})
            } else {
                self.filteredRecipes = self.recipes.filter({ self.containsItem(recipe: $0, str: str!)})
            }
            
        }
        
        recipeList.reloadData()
    }
    
    func containsItem(recipe: Recipe, str: String) -> Bool {
        if recipe.name.lowercased().range(of: str.lowercased()) != nil {
            return true
        }
        for item in recipe.ingredients {
            if item.name.lowercased().range(of: str.lowercased()) != nil {
                return true
            }
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == recipeSegueIdentifier) {
            let destination = segue.destination as! RecipeDetailViewController
            let tableIndex = sender as! Int
            if (index == 0) {
                destination.curRecipe = filteredFavorites[tableIndex]
            } else {
                destination.curRecipe = filteredRecipes[tableIndex]
            }
        }
     }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        dropDownTableView.cellForRow(at: indexPath)?.textLabel?.textColor = UIColor.black
    }
    
    //used to force a segue to recipe detail view or to sort list depending on which table is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == recipeList {
            tableView.deselectRow(at: indexPath, animated: true)
            let row = indexPath.section
            performSegue(withIdentifier: recipeSegueIdentifier, sender: row)
        } else {
            let row = indexPath.row
            var tempRecipeList = filteredFavorites
            if (index == 1) {
                tempRecipeList = filteredRecipes
            }
            if (row == 0) {
                //sort list by alphabetical
                tempRecipeList.sort{$0.name <= $1.name}
                dropDownButton.setTitle("Sorted Alphabeticaly", for: .normal)
                dropDownTableView.cellForRow(at: indexPath)?.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else if (row == 1) {
                //sort list by rating
                tempRecipeList.sort{$0.rating >= $1.rating}
                dropDownButton.setTitle("Sorted by Rating", for: .normal)
                dropDownTableView.cellForRow(at: indexPath)?.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else if (row == 2) {
                //sort list by cook time
                tempRecipeList.sort{$0.cookTime <= $1.cookTime}
                dropDownButton.setTitle("Sorted by Cook Time", for: .normal)
                dropDownTableView.cellForRow(at: indexPath)?.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                //sort list by difficulty
                tempRecipeList.sort{$0.difficulty.toSort() <= $1.difficulty.toSort()}
                dropDownButton.setTitle("Sorted by Difficulty", for: .normal)
                dropDownTableView.cellForRow(at: indexPath)?.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            
            dropDownTableView.isHidden = true
            dropDownActive = false
            
            if (index == 0) {
                filteredFavorites = tempRecipeList
            } else {
                filteredRecipes = tempRecipeList
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
        filter()
        filteredFavorites.sort{$0.name <= $1.name}
        dropDownTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        dropDownActive = false
    }
    
    @IBAction func recipeButtonClicked(_ sender: Any) {
        self.switchToAll()
    }
    
    func switchToAll() {
        if index == 1 {
            return
        }
        index = 1
        recipeButton.setBackgroundImage(selectedTabImg, for: .normal)
        favoriteButton.setBackgroundImage(unselectedTabImg, for: .normal)
        
        //defaults dial back to alphabetical
        dropDownButton.setTitle("Sort recipe by...", for: .normal)
        dropDownTableView.isHidden = true
        filter()
        recipeList.reloadData()
        filteredRecipes.sort{$0.name <= $1.name}
        dropDownTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        dropDownActive = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        self.dropDownTableView.delaysContentTouches = false
        self.recipeList.delaysContentTouches = false
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
        
        favorites = Data.sharedData.favoritedRecipes as! [Recipe]
        recipes = Data.sharedData.allRecipes as! [Recipe]
        filteredFavorites = favorites
        filteredRecipes = recipes
        
        recipeList.reloadData()
        
        self.searchBar.text = ""
        if comingFromInventory {
            searchBar.text = searchStr
            self.switchToAll()
            comingFromInventory = false
        }
        
        filter()
        
        filteredFavorites.sort{$0.name <= $1.name}
        filteredRecipes.sort{$0.name <= $1.name}
        
        
        dropDownButton.setTitle("Sort recipe by...", for: .normal)
        dropDownButton.layer.cornerRadius = 7
        dropDownButton.layer.masksToBounds = true
        dropDownButton.layer.borderColor = UIColor.gray.cgColor
        dropDownButton.layer.borderWidth = 1
        dropDownButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.init(rawValue: 5)!
        
        dropDownTableView.isHidden = true
        dropDownTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .none)
        dropDownTableView.separatorStyle = .none
        dropDownTableView.layer.cornerRadius = 12
        dropDownTableView.layer.masksToBounds = true
        dropDownTableView.layer.borderColor = UIColor.black.cgColor
        dropDownTableView.layer.borderWidth = 1
        
        dropDownIcon.layer.borderWidth = 1
        dropDownIcon.layer.borderColor = UIColor.black.cgColor
        dropDownIcon.layer.cornerRadius = 12
        dropDownIcon.layer.masksToBounds = true
        
        print("In Recipes!")
    }
    
    //Return number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == recipeList {
            if (index == 0) {
                return filteredFavorites.count
            } else {
                return filteredRecipes.count
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
    
    func getRatingImage(rating: Double) -> UIImage {
        
        if rating >= 4.5 {
            return UIImage(named: "five-star")!
        } else if rating >= 3.5 {
            return UIImage(named: "four-star")!
        } else if rating >= 2.5 {
            return UIImage(named: "three-star")!
        } else if rating >= 1.5 {
            return UIImage(named: "two-star")!
        } else if rating >= 0.5 {
            return UIImage(named: "one-star")!
        }
        return UIImage(named: "zero-star")!
    }
    
    
    //Format and return cell for given row indexPath.row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == recipeList {
            let recipeCell = Bundle.main.loadNibNamed("RecipeTableViewCell", owner: self, options: nil)?.first as! RecipeTableViewCell
        
            var tempList = self.filteredFavorites
        
            if (index == 1) {
                tempList = filteredRecipes
            }
        
            let curRecipe = tempList[indexPath.section]
        
            recipeCell.recipeName.text = curRecipe.name
            recipeCell.recipe = curRecipe
            recipeCell.recipeImage.image = UIImage(named: curRecipe.imageString)
            let ratingImg = getRatingImage(rating: curRecipe.rating)
            recipeCell.ratingImage.image = ratingImg
        
            recipeCell.layer.cornerRadius = 12
            recipeCell.layer.masksToBounds = true
            recipeCell.layer.borderWidth = 1
            recipeCell.layer.borderColor = UIColor.gray.cgColor
        
            return recipeCell
        } else {
            
            let cell = Bundle.main.loadNibNamed("DropDownTableViewCell", owner: self, options: nil)?.first as! DropDownTableViewCell
            cell.textLabel?.text = sortData[indexPath.row]
            cell.textLabel?.textAlignment = NSTextAlignment.center
            cell.textLabel?.font = UIFont(name: "American Typewriter", size: 15)
            cell.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            let bgView = UIView()
            bgView.backgroundColor = #colorLiteral(red: 0.2695342898, green: 0.5220056176, blue: 0.7386800647, alpha: 1)
            cell.selectedBackgroundView = bgView
            let cellBorderColor = #colorLiteral(red: 0.2527815998, green: 0.480304122, blue: 0.6649092436, alpha: 1)
            cell.layer.borderColor = cellBorderColor.cgColor
            cell.layer.borderWidth = 1
            if indexPath.row == 0 {
                cell.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                cell.textLabel?.textColor = UIColor.black
            }
            
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
