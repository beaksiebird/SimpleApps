//
//  ViewController.swift
//  Reaction
//
//  Created by Whitney Lauren on 7/1/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    @IBOutlet weak var goButton: CircleButton!
    
    @IBOutlet weak var topScore: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        topScore.alpha = 0
    
        goButton.alpha = 0
        goButton.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            
            self.goButton.alpha = 1
            self.goButton.transform = CGAffineTransformMakeScale(1.0, 1.0)
        })
        
        GKLocalPlayer.localPlayer().authenticateHandler = {
            (viewController, error) -> Void in
            
            if viewController != nil {
                
               self.presentViewController(viewController, animated: true, completion: nil)
                
            } else {
                
                println(GKLocalPlayer.localPlayer().authenticated)
                
                self.loadScore()
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
        override func viewWillAppear(animated: Bool) {
            
            loadScore()
        }
        
    func loadScore() {
        
        if GKLocalPlayer.localPlayer().authenticated == false { return }
        
        GKLeaderboard.loadLeaderboardsWithCompletionHandler { (leaderboards, error) -> Void in
            
            println(leaderboards)
            
            for leaderboard in leaderboards as! [GKLeaderboard] {
                
                  if leaderboard.identifier == "circles_touched" {
                    
                   leaderboard.loadScoresWithCompletionHandler({ (scores, error) -> Void in
                    
                    println(scores)
                    
                        if leaderboard.localPlayerScore != nil {
                            
                            self.topScore.text = "\(leaderboard.localPlayerScore.value)"
                            
                            UIView.animateWithDuration(0.4, animations: { () -> Void in
                                
                                self.topScore.alpha = 1 
                            })
                            
                        }
                    
                    })
                    
                }
            }
        }
    
    }


    @IBAction func go(sender: AnyObject) {
        
        if let gameVC = storyboard?.instantiateViewControllerWithIdentifier("GameVC") as? GameViewController
           
            {
            
            navigationController?.viewControllers = [gameVC]
            
            
        }
        
    }

}

