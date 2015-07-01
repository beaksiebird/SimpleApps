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
    
    
    @IBOutlet weak var topScore: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
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

