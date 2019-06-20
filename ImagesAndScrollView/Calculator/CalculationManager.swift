//
//  CalculationManager.swift
//  Calculator_27.05.2019
//
//  Created by Harut on 28/05/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit

class CalculationManager {
    private var calculator = Calculator()
    private var firstNumInputed: Bool = false
    private var secondNumInputed: Bool = false
    private var mathOperationPressed: Bool = false
    private var equalPressed: Bool = false
    private var percentagePressed: Bool = false
    private var activeOperation: Int = 0
    private var value1: String = "0"
    private var screenValue: String = "0"
    var result: String { return screenValue }
    
    
    func inputParser(_ sender: UIButton) {
        switch sender.tag {
        case 0...9, 17:
            digitPressed(sender)
        case 10:
            equal()
        case 11...14:
            actionPressed(sender)
        case 15:
            percentage()
        case 16:
            changeSign()
        default:
            clear()
        }
    }
    
    private func digitPressed(_ sender: UIButton) {
        if equalPressed || percentagePressed || screenValue == "Error" { clear() }
        
        if mathOperationPressed {
            screenValue = "0"
            mathOperationPressed = false
        }
        
        if sender.tag == 17 { // "." button
            if !screenValue.contains(".") { screenValue += "." }
        } else {
            if screenValue == "0" {
                screenValue = String(sender.tag)
            } else if screenValue.count < 9 {
                screenValue += String(sender.tag)
            }
            
            if firstNumInputed { secondNumInputed = true }
        }
    }
    
    private func actionPressed(_ sender: UIButton) {
        if secondNumInputed {
            calculation()
        } else {
            value1 = screenValue
            firstNumInputed = true
        }
        mathOperationPressed = true
        equalPressed = false
        percentagePressed = false
        activeOperation = sender.tag
    }
    
    private func equal() {
        if secondNumInputed {
            calculation()
            activeOperation = 0
            mathOperationPressed = false
            equalPressed = true
        }
    }
    
    private func clear() {
        value1 = "0"
        screenValue = "0"
        activeOperation = 0
        firstNumInputed = false
        secondNumInputed = false
        mathOperationPressed = false
        equalPressed = false
        percentagePressed = false
    }
    
    private func changeSign() {
        guard let doubleValue = Double(screenValue) else { return }
        screenValue = String(doubleValue * -1.0)
    }
    
    private func percentage() {
        guard let doubleValue = Double(screenValue) else { return }
        screenValue = String(doubleValue / 100)
        percentagePressed = true
    }
    
    
    //  ----------------- Supportive function ----------------------
    
    private func calculation() {
        let mathOperator: Operator
        switch activeOperation {
        case 11:
            mathOperator = .plus
        case 12:
            mathOperator = .minus
        case 13:
            mathOperator = .multiply
        case 14:
            mathOperator = .divide
        default:
            mathOperator = .doNothing
        }
        
        if mathOperator != .doNothing {
            screenValue = calculator.calculate(mathOperator, of: value1, and: screenValue)
        }
        value1 = screenValue
        secondNumInputed = false
    }
}
