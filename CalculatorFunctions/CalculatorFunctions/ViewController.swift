//
//  ViewController.swift
//  CalculatorFunctions
//
//  Created by Whitney Lauren on 5/5/15.
//  Copyright (c) 2015 Whitney Lauren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNumber = ""
    var secondNumber = ""
    
    var currentOperation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressedButton1(sender: UIButton) {
        
        //println(sender.currentTitle!)
        
        let number = sender.currentTitle!
        
        if currentOperation.isEmpty{
            
            firstNumber += number
            
        } else {
            secondNumber += number
            
        }
        
        //println("Pressed Button 1" + sender.currentTitle!)
        
    
   
    
    

        let operation = sender.currentTitle!
        
        if operation != "=" {
            currentOperation = operation
            println(operation)
        } else {

    switch currentOperation {
       
       case "/":
            let value = firstNumber.toInt()! / secondNumber.toInt()!
            println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)")
       case "-":
            println("do subtraction")

       default :

            println("something")
        }
    
    }
        
    }
    @IBAction func operatorPressed(sender:
        UIButton) {
    
    //let operation = sender.currentTitle!
    
    //if operation == "+" {
            //add number
    }
    //if operation == "-" {
    
            //run number

    
}

    
    





