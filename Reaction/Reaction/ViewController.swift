//
//  ViewController.swift
//  Reaction
//
//  Created by Whitney Lauren on 7/1/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var topScore: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
   
    }


    @IBAction func go(sender: AnyObject) {
        
        if let gameVC = storyboard?.instantiateViewControllerWithIdentifier("GameVC") as? GameViewController
           
            {
            
            navigationController?.viewControllers = [gameVC]
            
            
        }
        
    }

}

