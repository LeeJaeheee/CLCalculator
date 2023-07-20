//
//  Calculator.swift
//  Lv4
//
//  Created by 이재희 on 2023/07/20.
//

class Calculator {
    private var _op: AbstractOperation
    
    var op: AbstractOperation {
        get { return _op }
        set(newValue) { _op = newValue }
    }
    
    init(_op: AbstractOperation) {
        self._op = _op
    }
    
    func calculate(firstNum: Double, secondNum: Double) -> Double {
        _op.operate(firstNum: firstNum, secondNum: secondNum)
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
