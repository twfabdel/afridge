//
//  RecipeDetailViewController.swift
//  AfrIdge
//
//  Created by Brian Rossi on 11/29/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeDifficulty: UILabel!
    @IBOutlet weak var recipeRating: UILabel!
    @IBOutlet weak var recipeCookTime: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var recipeScroll: UITextView!
    @IBOutlet weak var topNavigationBar: UINavigationItem!
    @IBOutlet weak var ingredientListView: UITableView!
    
    var curRecipe: Recipe!
    var missingIngredients = [FoodItem]()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        let newImage = UIImage(named: curRecipe.imageString)
        
        recipeImage.image = newImage
        recipeDifficulty.text = curRecipe.difficulty.rawValue
        recipeRating.text = String(curRecipe.rating)
        
        recipeCookTime.text = String(curRecipe.cookTime) + " mins"
        
        if (curRecipe.favorite) {
            favoriteButton.setTitle("Unfavorite", for: .normal)
        } else {
            favoriteButton.setTitle("Favorite", for: .normal)
        }
        
        videoButton.setTitle("Video Tutorial", for: .normal)
        
        recipeScroll.text = curRecipe.description
        
        topNavigationBar.title = curRecipe.name
        
        ingredientListView.separatorStyle = .none
        
        
        
        //additional formatting of page
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        recipeScroll.setContentOffset(CGPoint.zero, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("In Recipe Controller!")
            
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func videoClicked(_ sender: Any) {
        let url = URL(string: curRecipe.videoLink)
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url!)
        }
    }
    
    @IBAction func favoriteButtonClicked(_ sender: Any) {
        if (curRecipe.favorite) {
            //unfavoriting recipe
            
            for i in 0 ..< Data.sharedData.favoritedRecipes.count {
                if Data.sharedData.favoritedRecipes[i].name == curRecipe.name {
                    Data.sharedData.favoritedRecipes.remove(at: i)
                    break
                }
            }
            
            curRecipe.favorite = false
            
            //need to make sure duplicate in allRecipes is unfavorited
            for i in 0 ..< Data.sharedData.allRecipes.count {
                if Data.sharedData.allRecipes[i].name == curRecipe.name {
                    Data.sharedData.allRecipes[i].favorite = false
                    break
                }
            }
            
            favoriteButton.setTitle("Favorite", for: .normal)
        } else {
            //favoriting recipe
            
            //need to make sure duplicate in allRecipes is favorited
            for i in 0 ..< Data.sharedData.allRecipes.count {
                if Data.sharedData.allRecipes[i].name == curRecipe.name {
                    Data.sharedData.allRecipes[i].favorite = true
                    break
                }
            }
            
            curRecipe.favorite = true
            Data.sharedData.favoritedRecipes.append(curRecipe)
            favoriteButton.setTitle("Unfavorite", for: .normal)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(curRecipe.ingredients.count)
        return ((curRecipe.ingredients.count + 1)/2)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row*2
        
        let cell = Bundle.main.loadNibNamed("IngredientsTableViewCell", owner: self, options: nil)?.first as! IngredientsTableViewCell
        
        let text1 = curRecipe.ingredients[index].name + " " + String(curRecipe.ingredients[index].amount)
        cell.ingredientLabel1.text = text1
        cell.ingredientLabel1.layer.borderColor = UIColor.gray.cgColor
        cell.ingredientLabel1.layer.borderWidth = 1
        cell.ingredientLabel1.textAlignment = NSTextAlignment.center
        
        if notInInventory(item: curRecipe.ingredients[index]) {
            //style cell to be highlighted as missing from inventory
            cell.ingredientLabel1.backgroundColor = #colorLiteral(red: 0.8459790349, green: 0.2873021364, blue: 0.2579272389, alpha: 1)
            cell.ingredientLabel1.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.ingredientLabel1.layer.borderColor = UIColor.black.cgColor
        }
        
        if index + 1 < curRecipe.ingredients.count {
            let text2 = curRecipe.ingredients[index + 1].name + " " + String(curRecipe.ingredients[index + 1].amount)
            
            cell.ingredientLabel2.text = text2
            cell.ingredientLabel2.layer.borderColor = UIColor.gray.cgColor
            cell.ingredientLabel2.layer.borderWidth = 1
            cell.ingredientLabel2.textAlignment = NSTextAlignment.center
            
            if notInInventory(item: curRecipe.ingredients[index + 1]) {
                //style cell to be highlighted as missing from inventory
                cell.ingredientLabel2.backgroundColor = #colorLiteral(red: 0.8459790349, green: 0.2873021364, blue: 0.2579272389, alpha: 1)
                cell.ingredientLabel2.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.ingredientLabel2.layer.borderColor = UIColor.black.cgColor
            }
        } else {
            //odd number of ingredients, hide last label
            cell.ingredientLabel2.isHidden = true
        }
        
        return cell
    }
    
    func notInInventory(item: FoodItem) -> Bool {
        for i in 0 ..< Data.sharedData.inventoryItems.count {
            if Data.sharedData.inventoryItems[i].name == item.name {
                //check if we have enough of item left for this recipe (how do we compare the string?
                if Data.sharedData.inventoryItems[i].amount > item.amount {
                    return false
                } else {
                    //add to missing list
                    missingIngredients.append(item)
                    return true
                }
            }
        }
        //add to missing list
        missingIngredients.append(item)
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
