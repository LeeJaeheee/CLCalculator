//
//  main.swift
//  Lv1
//
//  Created by 이재희 on 2023/07/18.
//

import Foundation

let calculator = Calculator()
let num1 = Double(Int.random(in: 0...100))
let num2 = Double(Int.random(in: 0...100))

let addResult = calculator.calculate(op: "+", firstNum: num1, secondNum: num2)
let subtractResult = calculator.calculate(op: "-", firstNum: num1, secondNum: num2)
let multiplyResult = calculator.calculate(op: "*", firstNum: num1, secondNum: num2)
let divideResult = calculator.calculate(op: "/", firstNum: num1, secondNum: num2)

print("[NUM1] : \(num1), [NUM2] : \(num2)")
print("\(num1) + \(num2) = \(addResult)")
print("\(num1) - \(num2) = \(subtractResult)")
print("\(num1) * \(num2) = \(multiplyResult)")
print("\(num1) / \(num2) = \(divideResult)")
