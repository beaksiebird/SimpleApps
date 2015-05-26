//
//  ViewController.swift
//  TicTacToeLayout
//
//  Created by Whitney Lauren on 5/8/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    
    
    //Connects a way to restart the game if/when a winner is found
    
    @IBAction func reStart(sender: UIButton) {
        
        
        
        if winnerIsFound == false {
            
            println("placholder")
            
        }
        
        
        println("reset")
        loadView()
        playAgain.hidden = true
        
    }
    
    //Yes, I am aware that these buttons are not connected :)
    
    //Displays which players turn it is.
    
    @IBOutlet weak var playerIndicator: UILabel!
    
    //Displays button to restart game
    @IBOutlet weak var playAgain: UILabel!
    
    //Displays which player has won.
    @IBOutlet weak var displayWinner: UILabel!
    
    //Is a winner found? Yes or no?
    
    var winnerIsFound: Bool = false
    
    
    //The array that represents the game board.
    
    var spaces: [[Player?]] = [
        
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil]
        
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        playAgain.hidden = true
    }
    
    //Indicates which player is playing.
    var currentPlayer: Player = .One
    
    //Functions for button pressing.
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
    //These are all of the gameplay possibilities.
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
    //This function uses the possibilities array to check for the winner.
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
        
        
         println("Player 2 has failed")
      
        
    }
    
    //This function ends teh game when a winner is found. 
    func endGame() {
        
        winnerIsFound = true
        
        playerIndicator.hidden = true
        
        
    }
    
    
    
    
    
    
    
}



