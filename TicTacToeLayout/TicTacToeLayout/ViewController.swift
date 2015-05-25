//
//  ViewController.swift
//  TicTacToeLayout
//
//  Created by Whitney Lauren on 5/8/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    
    
    
    
    @IBAction func reStart(sender: UIButton) {
        
        
        
        if winnerIsFound == false {
            
            println("placholder")
            
        }
        
        
        println("reset")
        loadView()
        playAgain.hidden = true
        
    }
    
    
    
    
    
    @IBOutlet weak var playerIndicator: UILabel!
    
    
    @IBOutlet weak var playAgain: UILabel!
    
    
    @IBOutlet weak var displayWinner: UILabel!
    
    var winnerIsFound: Bool = false
    
    
    
    
    var spaces: [[Player?]] = [
        
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        playAgain.hidden = true
    }
    
    
    var currentPlayer: Player = .One
    
    
    @IBAction func buttonPressed(sender: TButton) {
    
        
        
        
        
        if winnerIsFound == false {
            
            if sender.player != nil { return }
            
            sender.player = currentPlayer
            sender.setNeedsDisplay()
            spaces [sender.row ] [sender.col] = currentPlayer
            
            println(spaces)
            
            checkForWinner()
            
            if currentPlayer == .One {
                
                playerIndicator.text = "Green Players's Turn!"
                
                playerIndicator.textColor = UIColor.greenColor()
                
                
            } else {
                
                playerIndicator.text = "Orange Player's Turn!"
                
                playerIndicator.textColor = UIColor.orangeColor()
                
                
                
            }
            
            
            
            
            currentPlayer = (currentPlayer == .One) ? .Two : .One
            
        } else {
            println("Already have winner")
            
            
            
            
        }
    }
    
    var possibilities = [
        [0,0,0,1,0,2],
        [1,0,1,1,1,2],
        [2,0,2,1,2,2],
        [0,0,1,0,2,0],
        [0,1,1,1,2,1],
        [0,2,1,2,2,2],
        [0,0,1,1,2,2],
        [2,0,1,1,0,2],
        
    ]
    
    func checkForWinner() {
        
        
        for possibility in possibilities {
            
            
            let firstSpot = spaces[possibility[0]][possibility[1]]
            let secondSpot = spaces[possibility[2]][possibility[3]]
            let thirdSpot = spaces[possibility[4]][possibility[5]]
            
            
            if firstSpot == secondSpot && secondSpot == thirdSpot {
                
                if let winner = firstSpot {
                    
                    println("player \(winner.hashValue + 1) wins")
                    
                    displayWinner.text = "player \(winner.hashValue + 1) wins"
                    
                    endGame()
                    
                    playAgain.hidden = false
                    
                    
                }
                
            }
            
            
        }
        
        
         println("Player 2 got CGrekt")
      
        
    }
    
    
    func endGame() {
        
        winnerIsFound = true
        
        playerIndicator.hidden = true
        
        
    }
    
    
    
    
    
    
    
}



