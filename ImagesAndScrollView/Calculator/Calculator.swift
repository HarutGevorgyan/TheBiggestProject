//
//  Calculator.swift
//  Calculator_27.05.2019
//
//  Created by Harut on 27/05/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import Foundation

class Calculator {
    
    func calculate(_ theOperator: Operator, of firstValue: Any, and secondValue: Any) -> String {
        guard let firstValue = self.castAsDouble(firstValue) else { return "Error" }
        guard let secondValue = self.castAsDouble(secondValue) else { return "Error" }
        return self.calculate(theOperator, of: firstValue, and: secondValue)
    }
    
    private func castAsDouble(_ value: Any) -> Double? {
        if let value = value as? Double {
            return value
        } else if let value = value as? Int {
            return Double(value)
        } else if let value = value as? String {
            return Double(value)
        } else {
            return nil
        }
    }
    
    
    func calculate(_ theOperator: Operator, of firstValue: Double, and secondValue: Double) -> String {
        switch theOperator {
        case .plus:
            return String(firstValue + secondValue)
        case .minus:
            return String(firstValue - secondValue)
        case .multiply:
            return String(firstValue * secondValue)
        case .divide:
            guard secondValue != 0 else { return "Error" }
            return String(firstValue / secondValue)
        default:
            return "Error"
        }
    }
}
