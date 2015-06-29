//
//  MotionScene.swift
//  Level
//
//  Created by Whitney Lauren on 6/29/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit
import SpriteKit

class MotionScene: SKScene {
    
    let dot = SKShapeNode(ellipseOfSize: CGSize(width: 40, height: 40))
    
    override func didMoveToView(view: SKView) {
        
        physicsWorld.gravity = CGVectorMake(0, 0)
        
        size = view.frame.size
        
        dot.fillColor = UIColor.whiteColor()
        dot.position = view.center
        addChild(dot)
        
        dot.physicsBody = SKPhysicsBody(circleOfRadius: 20)
        
        physicsBody = SKPhysicsBody(edgeLoopFromRect: view.bounds)
        
        
    }
   
}
