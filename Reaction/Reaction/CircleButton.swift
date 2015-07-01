//
//  CircleButton.swift
//  Reaction
//
//  Created by Whitney Lauren on 7/1/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

@IBDesignable class CircleButton: UIButton {
    
    var choice: Int!

    @IBInspectable var fillColor = UIColor.whiteColor()
  
    override func drawRect(rect: CGRect) {
        
    let context = UIGraphicsGetCurrentContext()
        
        fillColor.set()
        
        CGContextFillEllipseInRect(context, rect)
        
        
    }
    
}