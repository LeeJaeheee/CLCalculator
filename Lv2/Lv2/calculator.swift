//
//  calculator.swift
//  Lv2
//
//  Created by 이재희 on 2023/07/18.
//

class Calculator {
    func calculate(op: String, firstNum: Int, secondNum: Int) -> Int {
        switch op {
        case "+": return firstNum + secondNum
        case "-": return firstNum - secondNum
        case "*": return firstNum * secondNum
        case "/": return firstNum / secondNum
        case "%": return firstNum % secondNum
        default: return 0
        }
    }
}
