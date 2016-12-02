//
//  DoneShoppingViewController.swift
//  AfrIdge
//
//  Created by Tarek Abdelghany on 12/2/16.
//  Copyright © 2016 AfrIdge. All rights reserved.
//

import UIKit

class DoneShoppingViewController: UIViewController {
    
    @IBOutlet weak var popUp: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 0.5)
        self.popUp.layer.cornerRadius = 20
        
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
