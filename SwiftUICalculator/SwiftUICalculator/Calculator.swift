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
    init(_op: ButtonType) {
        self._op = _op
    }
    
    func calculate(firstNum: Double, secondNum: Double) -> Double {
        switch _op {
        case .plus: return AddOperation().calculate(firstNum: firstNum, secondNum: secondNum)
        case .minus: return SubtractOperation().calculate(firstNum: firstNum, secondNum: secondNum)
        case .multiple: return MultiplyOperation().calculate(firstNum: firstNum, secondNum: secondNum)
        case .divide: return DivideOperation().calculate(firstNum: firstNum, secondNum: secondNum)
        default: return secondNum
        }
    }
}

class AbstractOperation {
    func calculate(firstNum: Double, secondNum: Double) -> Double {
        return 0
    }
}

class AddOperation: AbstractOperation {
    override func calculate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum + secondNum
    }
}

class SubtractOperation: AbstractOperation {
    override func calculate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum - secondNum
    }
}

class MultiplyOperation: AbstractOperation {
    override func calculate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum * secondNum
    }
}

class DivideOperation: AbstractOperation {
    override func calculate(firstNum: Double, secondNum: Double) -> Double {
        return firstNum / secondNum
    }
}
