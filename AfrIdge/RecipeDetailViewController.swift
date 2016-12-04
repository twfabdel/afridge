//
//  RecipeDetailViewController.swift
//  AfrIdge
//
//  Created by Brian Rossi on 11/29/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeDifficulty: UILabel!
    @IBOutlet weak var recipeRating: UILabel!
    @IBOutlet weak var recipeCookTime: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var recipeScroll: UITextView!
    @IBOutlet weak var topNavigationBar: UINavigationItem!
    
    var curRecipe: Recipe!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        let newImage = UIImage(named: curRecipe.imageString)
        recipeImage.image = newImage
        recipeDifficulty.text = curRecipe.difficulty.rawValue
        recipeRating.text = String(curRecipe.rating)
        recipeCookTime.text = String(curRecipe.cookTime)
        
        if (curRecipe.favorite) {
            favoriteButton.setTitle("Unfavorite", for: .normal)
        } else {
            favoriteButton.setTitle("Favorite", for: .normal)
        }
        
        videoButton.setTitle("Video Tutorial", for: .normal)
        
        recipeScroll.text = curRecipe.description
        
        topNavigationBar.title = curRecipe.name
        
        
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
            Data.sharedData.unfavoritedRecipes.append(curRecipe)
            favoriteButton.setTitle("Favorite", for: .normal)
        } else {
            //favoriting recipe
            
            for i in 0 ..< Data.sharedData.unfavoritedRecipes.count {
                if Data.sharedData.unfavoritedRecipes[i].name == curRecipe.name {
                    Data.sharedData.unfavoritedRecipes.remove(at: i)
                    break
                }
            }
            
            curRecipe.favorite = true
            Data.sharedData.favoritedRecipes.append(curRecipe)
            favoriteButton.setTitle("Unfavorite", for: .normal)
        }
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
