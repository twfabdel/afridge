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
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.5, alpha: 0.5)
        self.popUp.layer.cornerRadius = 20
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    

}
