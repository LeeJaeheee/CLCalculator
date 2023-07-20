//
//  main.swift
//  Lv3
//
//  Created by 이재희 on 2023/07/20.
//

let calculator = Calculator(
    // 프로퍼티 초기화
)
let num1 = Double(Int.random(in: 0...100))
let num2 = Double(Int.random(in: 0...100))

let addResult = calculator.calculate(op: "+", firstNum: <#T##Double#>, secondNum: <#T##Double#>)
let subtractResult = calculator.calculate(op: "-", firstNum: <#T##Double#>, secondNum: <#T##Double#>)
let multiplyResult = calculator.calculate(op: "*", firstNum: <#T##Double#>, secondNum: <#T##Double#>)
let divideResult = calculator.calculate(op: "/", firstNum: <#T##Double#>, secondNum: <#T##Double#>)

print("[NUM1] : \(num1), [NUM2] : \(num2)")
print("\(num1) + \(num2) = \(addResult)")
print("\(num1) - \(num2) = \(subtractResult)")
print("\(num1) * \(num2) = \(multiplyResult)")
print("\(num1) / \(num2) = \(divideResult)")
