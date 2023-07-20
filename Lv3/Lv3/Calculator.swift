//
//  Calculator.swift
//  Lv3
//
//  Created by 이재희 on 2023/07/20.
//

class Calculator {
    let add = AddOperation()
    let subtract = SubtractOperation()
    let multiply = MultiplyOperation()
    let divide = DivideOperation()
    
    func calculate(op: String, firstNum: Double, secondNum: Double) -> Double {
        switch op {
        case "+": return add.operate(firstNum: firstNum, secondNum: secondNum)
        case "-": return subtract.operate(firstNum: firstNum, secondNum: secondNum)
        case "*": return multiply.operate(firstNum: firstNum, secondNum: secondNum)
        case "/": return divide.operate(firstNum: firstNum, secondNum: secondNum)
        default: return 0
        }
    }
}

class AddOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum + secondNum
    }
}

class SubtractOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum - secondNum
    }
}

class MultiplyOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum * secondNum
    }
}

class DivideOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum / secondNum
    }
}
