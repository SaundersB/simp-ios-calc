//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Brandon Saunders on 6/22/15.
//  Copyright (c) 2015 Brandon Saunders. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    enum Op {
        case Operand(Double)
        case Operation(String,(Double) -> Double)
        case BinaryOperation(String, (Double,Double) -> Double)
    }
    
    var opStack = [Op]()
    
    var knownOps = [String:Op]()
    
    init() {
        knownOps ["×"] = Op.BinaryOperation("×") {$0 * $1}
        knownOps ["÷"] = Op.BinaryOperation("÷") {$1 / $0}
        knownOps ["+"] = Op.BinaryOperation("+") {$0 + $1}
        knownOps ["−"] = Op.BinaryOperation("-") {$1 - $0}
        //knownOps ["√"] = Op.UnaryOperation("√",sqrt)
    }
    
    func pushOperand(operand: Double) {
        opStack.append(Op.Operand(operand))
    }
    
    func performOperation(symbol: String) {
        
    }
}
