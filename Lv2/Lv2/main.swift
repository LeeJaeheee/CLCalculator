//
//  main.swift
//  Lv2
//
//  Created by 이재희 on 2023/07/18.
//

let calculator = Calculator()
let num1 = Int.random(in: 0...100)
let num2 = Int.random(in: 0...100)

let addResult = calculator.calculate(op: "+", firstNumber: num1, secondNumber: num2)
let subtractResult = calculator.calculate(op: "-", firstNumber: num1, secondNumber: num2)
let multiplyResult = calculator.calculate(op: "*", firstNumber: num1, secondNumber: num2)
let divideResult = calculator.calculate(op: "/", firstNumber: num1, secondNumber: num2)
let remainderResult = calculator.calculate(op: "%", firstNumber: num1, secondNumber: num2)

print("[NUM1] : \(num1), [NUM2] : \(num2)")
print("\(num1) + \(num2) = \(addResult)")
print("\(num1) - \(num2) = \(subtractResult)")
print("\(num1) * \(num2) = \(multiplyResult)")
print("\(num1) / \(num2) = \(divideResult)")
print("\(num1) % \(num2) = \(remainderResult)")
