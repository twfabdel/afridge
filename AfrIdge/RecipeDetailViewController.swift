//
//  RecipeDetailViewController.swift
//  AfrIdge
//
//  Created by Brian Rossi on 11/29/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeDifficulty: UILabel!
    @IBOutlet weak var recipeRating: UILabel!
    @IBOutlet weak var recipeCookTime: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    var curRecipe: Recipe!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        recipeNameLabel.text = curRecipe.name
        let newImage = UIImage(named: curRecipe.imageString)
        recipeImage.image = newImage
        recipeDifficulty.text = curRecipe.difficulty.rawValue
        recipeRating.text = String(curRecipe.rating)
        recipeCookTime.text = String(curRecipe.cookTime)
        
        if (curRecipe.favorite) {
            favoriteButton.setTitle("Unfavorite", for: .normal)
        } else {
            favoriteButton.setTitle("Add To Favorites", for: .normal)
        }
        
        videoButton.setTitle("Video Tutorial", for: .normal)
        
        //additional formatting of page
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
