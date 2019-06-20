//
//  Label_Extension.swift
//  Calculator_27.05.2019
//
//  Created by Harut on 28/05/2019.
//  Copyright © 2019 Harut. All rights reserved.
//

import UIKit

extension UILabel {
    func updateText(with value: String) {
        if value == "0." { self.text = value; return }
        guard let doubleValue = Double(value) else { self.text = value; return }
        
        var sValue: String = value
        
        if doubleValue - Double(Int(doubleValue)) == 0 {
            sValue = String(Int(doubleValue))
        }
        
        if sValue.count > 9 {
            if String(Int(doubleValue)).count <= 9 {
                sValue = String(sValue.prefix(9))
            } else {
                sValue = "\(Array(sValue)[0]).\(Array(sValue)[1])" + " e" + "\(sValue.count-1)"
                self.text = sValue
                return
            }
        }
        format(&sValue, with: ",")
        
        self.text = sValue
    }
}


// ------------ Supportive function ------------------

func format(_ value: inout String, with separator: String) {
    var minus: String? = nil
    
    if value.first == "-" {
        value.remove(at: value.startIndex)
        minus = "-"
    }
    
    var splittedValue = value.split(separator: ".")
    
    if splittedValue[0].count > 3 {
        var s: String = ""
        for (i, c) in splittedValue[0].reversed().enumerated() {
            if i > 0 && i % 3 == 0 {
                s += separator
            }
            s += "\(c)"
        }
        value = String(s.reversed())
        
        if splittedValue.count > 1 {
            value += "." + splittedValue[1]
        }
    }
    
    if let minus = minus {
        value = minus + value
    }
}
