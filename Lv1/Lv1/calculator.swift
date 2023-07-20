//
//  calculator.swift
//  Lv1
//
//  Created by 이재희 on 2023/07/18.
//

import Foundation

class Calculator {
    func calculate(op: String, firstNum: Double, secondNum: Double) -> Double {
        switch op {
        case "+":
            return firstNum + secondNum
        case "-":
            return firstNum - secondNum
        case "*":
            return firstNum * secondNum
        case "/":
            return firstNum / secondNum
        default:
            return 0
        }
    }
}
