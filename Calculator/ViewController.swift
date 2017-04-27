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
    @IBAction func appendDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if(digit == "AC" || digit == "CE")
        {
            display.text = "0"
        }
        else
        {
            if userIsInTheMiddleOfTypingANumber {
                display.text = display.text! + digit
            }
            else {
                display.text = digit
                userIsInTheMiddleOfTypingANumber = true
            }
        }
    }
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        
        switch operation {
            // $0 top of stack
            // $1 bottom of stack
            // [$1, $0]
            case "×":
                performOperation { $0 * $1 }
            case "÷":
                performOperation { $1 / $0 }
            case "+":
                performOperation { $0 + $1 }
            case "−":
                performOperation { $1 - $0 }
            case "√":
                performOperationSingle { sqrt($0) }
            case "AC":
                performAllClear()
            case "CE":
                performClearEntry()
            default: break
        }

    }
    
    var operandStack: Array<Double> = Array<Double>()
    
    var displayValue: Double {
        get
        {
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }
        set
        {
            display.text = "\(newValue)" // Converts a string to a double.
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    func performOperation(_ operation: (Double,Double) -> Double) {
        if operandStack.count >= 2 {
            print("PERFORMOPERATION")
            // perform ops on digits on stack
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperationSingle(_ operation: (Double) -> Double) {
        if operandStack.count >= 2 {
            // perform ops on digits on stack
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
    
    // clear the calculator
    func performAllClear()
    {
        // clear the stack
        while(operandStack.count != 0)
        {
            operandStack.removeLast()
        }
        displayValue = 0;
        print("after AC: operandStack = \(operandStack)")
    }

    func performClearEntry()
    {
        if(operandStack.count != 0)
        {
            operandStack.removeLast()
        }
        displayValue = 0;
        print("after CE: operandStack = \(operandStack)")
    }
  
    // add the displayvalue to the stack
    func enter() {
        print("before append: operandStack = \(operandStack)")
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)

        //performOperation
        print("after append: operandStack = \(operandStack)")
    }
}
