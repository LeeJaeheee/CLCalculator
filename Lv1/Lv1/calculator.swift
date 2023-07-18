//
//  calculator.swift
//  Lv1
//
//  Created by 이재희 on 2023/07/18.
//

import Foundation

class Calculator {
    func calculate(op: String, firstNumber: Int, secondNumber: Int) -> Double {
        let dNum1 = Double(firstNumber)
        let dNum2 = Double(secondNumber)
        
        switch op {
        case "+":
            return dNum1 + dNum2
        case "-":
            return dNum1 - dNum2
        case "*":
            return dNum1 * dNum2
        case "/":
            return dNum1 / dNum2
        default:
            return 0
        }
    }
}
