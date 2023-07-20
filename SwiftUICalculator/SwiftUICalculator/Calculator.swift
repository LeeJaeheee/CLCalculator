//
//  Calculator.swift
//  SwiftUICalculator
//
//  Created by 이재희 on 2023/07/19.
//

import SwiftUI

class Calculator {
    private var _op: ButtonType
    var op: ButtonType {
        get { return _op }
        set(newValue) { _op = newValue }
    }
    //var oper: AbstractOperation?
    
    init(_op: ButtonType) {
        self._op = _op
    }
    
    func calculate(firstNum: Double, secondNum: Double) -> Double {
        //return (oper?.operate(firstNum: firstNum, secondNum: secondNum))!
        switch _op {
        case .plus: return AddOperation().operate(firstNum: firstNum, secondNum: secondNum)
        case .minus: return SubtractOperation().operate(firstNum: firstNum, secondNum: secondNum)
        case .multiple: return MultiplyOperation().operate(firstNum: firstNum, secondNum: secondNum)
        case .divide: return DivideOperation().operate(firstNum: firstNum, secondNum: secondNum)
        default: return secondNum
        }
    }
}

class AbstractOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return 0
    }
}

class AddOperation: AbstractOperation {
    override func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum + secondNum
    }
}

class SubtractOperation: AbstractOperation {
    override func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum - secondNum
    }
}

class MultiplyOperation: AbstractOperation {
    override func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum * secondNum
    }
}

class DivideOperation: AbstractOperation {
    override func operate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum / secondNum
    }
}
