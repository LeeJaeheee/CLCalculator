//
//  Calculator.swift
//  SwiftUICalculator
//
//  Created by 이재희 on 2023/07/19.
//

import SwiftUI

class Calculator {
    var oper: AbstractOperation = AbstractOperation()
    private var _op: ButtonType
    var op: ButtonType {
        get { return _op }
        set(newValue) {
            _op = newValue
            switch newValue {
            case .plus: oper = AddOperation()
            case .minus: oper = SubtractOperation()
            case .multiple: oper = MultiplyOperation()
            case .divide: oper = DivideOperation()
            default: oper = AbstractOperation()
            }
        }
    }
    
    init(_op: ButtonType) {
        self._op = _op
    }
    
    func calculate(firstNum: Double, secondNum: Double) -> Double {
        return oper.operate(firstNum: firstNum, secondNum: secondNum)
    }
}

class AbstractOperation {
    func operate(firstNum: Double, secondNum: Double) -> Double {
        return secondNum
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
