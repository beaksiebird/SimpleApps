//
//  BeaksieBird.swift
//  FromScratch
//
//  Created by Whitney Lauren on 5/7/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class BeaksieBird: UIView {
    
    override func didMoveToWindow() {
        
        var rn = arc4random_uniform(50)
        
        frame.size.height = CGFloat(rn)
        
        frame.size.width = CGFloat(rn)
        
        var randomInt = CGFloat(arc4random_uniform(100))
        
        layer.cornerRadius = frame.size.height / randomInt
        
        var randomRed = CGFloat(arc4random_uniform(255)) / 255.0
        var randomGreen = CGFloat(arc4random_uniform(255)) / 255.0
        var randomBlue = CGFloat(arc4random_uniform(255)) / 255.0
        
        
        alpha = CGFloat(arc4random_uniform(100)) / 100
        
        UIView.animateWithDuration(1, animations: {
            
            self.alpha = 0.0
            
            }, completion: nil)
        
        backgroundColor = UIColor(red:randomRed, green:randomGreen, blue:randomBlue, alpha:1)
        
        layer.cornerRadius = CGFloat(arc4random_uniform(2)) * frame.width / 2
        layer.masksToBounds = true
        
        transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2 / 2))
    }
}








