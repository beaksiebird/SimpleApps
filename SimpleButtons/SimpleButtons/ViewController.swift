//
//  ViewController.swift
//  SimpleButtons
//
//  Created by Whitney Lauren on 5/4/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var Screen: UILabel!
    
    var firstNumber = Int()
    
    var secondNumber = Int()
    
    var isTypingNumber = false
    
    var result = Int()
    
    var operation = ""
    
    
    
    @IBAction func Number(sender: AnyObject) {
        
        var number = sender.currentTitle
        
        if isTypingNumber == true {
            
            Screen.text = Screen.text! + number!!
            
        } else {
            Screen.text = number;
        }
        isTypingNumber = true
        
        }
        
    
    
    @IBAction func Operation(sender: AnyObject) {
        
        isTypingNumber = false
        
        firstNumber = Screen.text!.toInt()!
        
        operation = sender.currentTitle!!
        
        
    }
    
    
    @IBAction func Equals(sender: AnyObject) {
        
        secondNumber = Screen.text!.toInt()!
        
        if operation == "+" {
            
            result = firstNumber + secondNumber
            
            
        } else if operation == "-" {
            
            result = firstNumber - secondNumber
            
        } else if operation == "X" {
            
            result = firstNumber * secondNumber
            
        } else {
            
            result = firstNumber / secondNumber
        }
        Screen.text = "\(result)"
    }
    
    @IBAction func Clear(sender: AnyObject) {
       
        firstNumber = 0
        
        secondNumber = 0
        
        isTypingNumber = false
        
        result = 0
        
        Screen.text = "\(result)"
        
        
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }

    
}
