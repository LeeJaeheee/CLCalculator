//
//  main.swift
//  Lv4
//
//  Created by 이재희 on 2023/07/20.
//

let num1 = Double(Int.random(in: 0...100))
let num2 = Double(Int.random(in: 0...100))

let calculator = Calculator(_op: AddOperation())
let addResult = calculator.calculate(firstNum: num1, secondNum: num2)

calculator.op = SubtractOperation()
let subtractResult = calculator.calculate(firstNum: num1, secondNum: num2)

calculator.op = MultiplyOperation()
let multiplyResult = calculator.calculate(firstNum: num1, secondNum: num2)

calculator.op = DivideOperation()
let divideResult = calculator.calculate(firstNum: num1, secondNum: num2)

print("[NUM1] : \(num1), [NUM2] : \(num2)")
print("\(num1) + \(num2) = \(addResult)")
print("\(num1) - \(num2) = \(subtractResult)")
print("\(num1) * \(num2) = \(multiplyResult)")
print("\(num1) / \(num2) = \(divideResult)")

