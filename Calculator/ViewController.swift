//
//  ViewController.swift
//  Calculator
//
//  Created by Brandon Saunders on 6/22/15.
//  Copyright (c) 2015 Brandon Saunders. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Use the ! to unwrap the inferred variables.
    @IBOutlet weak var display: UILabel!
    
    // Removes the leading 0 in the display.
    var userIsInTheMiddleOfTypingANumber: Bool = false

    // Outputs the numbers to the display
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        }
        else {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        switch operation {
            case "×":
                if operandStack.count >= 2 {
                    displayValue = operandStack.removeLast() * operandStack.removeLast()
                    enter()
                }
                
//            case "÷":
//            case "+":
//            case "−":
        default: break

        }
    }
    
    var operandStack: Array<Double> = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
        
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        
        }
        set {
            display.text = "\(newValue)" // Converts a string to a double.
            userIsInTheMiddleOfTypingANumber = false
        }
    }
}

