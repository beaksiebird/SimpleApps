//
//  ViewController.swift
//  FromScratch
//
//  Created by Whitney Lauren on 5/7/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
       

            for touch in touches as! Set<UITouch> {
        
            let location = touch.locationInView(view)
            
            println("x = \(location.x) and y = \(location.y)")
            
            var box = BeaksieBird()
            view.addSubview(box)
            box.center = location
            
            
            

            }

        }

}
        //Normal Mode
        //Make box a circle
        //Randomize the circle size (width will be same as height)
        //Randomize the color of the circle
        //Randomize the alpha of the circle


        //Middle Mode
        //Transition to alpha 0 after 1 second

        //Hard Mode
        //Randomize whether it is round or not
        //Randomize between full circle -> rounded square -> square
        //Randomize rotation of box









