//
//  RecipesViewController.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 11/18/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var recipeList: UITableView!
    
    var recipes = [Recipe]();
    var favorites = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeLists()
    }
    
    func initializeLists() {
        recipes.append(Recipe(name:"Chicken Marsala", rating: 4.5, favorite: false)!)
        recipes.append(Recipe(name:"Chicken Parm", rating: 2.5, favorite: false)!)
        recipes.append(Recipe(name:"Southwestern Scramble", rating: 3.0, favorite: false)!)
        recipes.append(Recipe(name:"Roasted Brussel Sprouts", rating: 4.0, favorite: false)!)
        recipes.append(Recipe(name:"Tofu Sautee", rating: 3.5, favorite: false)!)
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
        recipeCell.rating.text = String(recipes[indexPath.row].rating)
        
        return(recipeCell)
    }
    
}
