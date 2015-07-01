//
//  GameViewController.swift
//  Reaction
//
//  Created by Whitney Lauren on 7/1/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var currentCircles: [CircleButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animateNewCirclesIn()

    }

    func animateNewCirclesIn() {
        
        var cW = (view.frame.width - 120) / 2
        var cR = cW / 2
        
        //top let, top right, bottom left, bottom right
        //(x,y)
        var directions: [(CGFloat,CGFloat)] = [(-1,-1),(1,-1),(-1,1),(1,1)]
        
        for c in 0..<4 {
            
            var circle = CircleButton()
            circle.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            circle.center = view.center
            view.addSubview(circle)
            
            currentCircles.append(circle)
            
            let (dx,dy) = directions[c]
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
            
                circle.frame.size.width = cW
                circle.frame.size.height = cW
                
                let x = self.view.center.x + dx * (cR + 10)
                let y = self.view.center.y + dy * (cR + 10)
                
                circle.center = CGPoint(x: x, y: y)
            
            })
            
        }
        
    }
    
    func animateOldCirclesOut() {
        
        var cW = (view.frame.width - 120) / 2 * 3
        
        for circle in currentCircles {
            
            let distX = circle.center.x - view.center.x
            let distY = circle.center.y - view.center.y
            
            UIView.animateWithDuration(1.0, animations: { () -> Void in
                
                circle.frame.size.width = cW
                circle.frame.size.height = cW
                
                circle.center = CGPoint(x: distX * 6 + self.view.center.x , y: distY * 6 + self.view.center.y)
                
            }, completion: { (finished) -> Void in
                
                circle.removeFromSuperview()
                
            })
            
        }
        
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        animateOldCirclesOut()
        
        currentCircles = []
        
        animateNewCirclesIn()
    }

    func endGame() {
        
    if let startVC = storyboard?.instantiateInitialViewController() as? GameViewController {
                
        navigationController?.viewControllers = [startVC]
                
        }
    
    }
}
