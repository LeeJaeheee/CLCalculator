//
//  ContentView.swift
//  SwiftUICalculator
//
//  Created by 이재희 on 2023/07/18.
//

import SwiftUI

struct ContentView: View {
    
    @State var totalNum: String = "0"
    @State var tempNum: Double = 0
    
    @State var op: ButtonType = .clear
    @State var calc = Calculator(_op: .clear)
    
    @State var isEditing: Bool = false
    @State var isClear: Bool = true
    
    private let buttonData: [[ButtonType]] = [
        [.clear, .opposite, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .point, .equal]
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(totalNum)
                        .padding()
                        .font(.system(size: 75))
                        .foregroundColor(.white)
                }
                
                ForEach(buttonData, id: \.self) { line in
                    HStack {
                        ForEach(line, id: \.self) { item in
                            Button {
                                if isClear {
                                    switch item {
                                    case .clear, .opposite, .percent, .equal:
                                        tempNum = 0
                                        totalNum = "0" // fix
                                        isEditing = false // fix
                                    case .plus, .minus, .multiple, .divide:
                                        op = item
                                        calc.op = item
                                        isEditing = false
                                        isClear = false
                                    case .point:
                                        totalNum += "."
                                        isEditing = true
                                        isClear = false
                                    default:
                                        totalNum = item.ButtonDisplayName
                                        isEditing = true
                                        isClear = false
                                    }
                                } else {
                                    if isEditing {
                                        switch item {
                                        case .clear:
                                            isClear = true
                                            tempNum = 0
                                            totalNum = "0"
                                        case .opposite:
                                            totalNum.insert("-", at: totalNum.startIndex)
                                        case .percent:
                                            totalNum = String(Double(totalNum)! / 100)
                                            isEditing = false
                                            isClear = true
                                        case .plus, .minus, .multiple, .divide:
                                            tempNum = Double(totalNum)!
                                            op = item
                                            calc.op = item
                                            isEditing = false
                                        case .point:
                                            totalNum = totalNum.contains(".") ? totalNum : totalNum + "."
                                        case .equal:
                                            if calc.op == .clear {
                                                
                                            } else if calc.op == .divide && totalNum == "0" {
                                                totalNum = "오류"
                                                isEditing = false
                                                isClear = true
                                            } else {
                                                totalNum = String(calc.calculate(firstNum: tempNum, secondNum: Double(totalNum)!))
                                                if totalNum.hasSuffix(".0") {
                                                    totalNum.removeLast(2)
                                                }
                                                tempNum = Double(totalNum)!
                                                isEditing = false
                                                op = item
                                                calc.op = .clear
                                            }
                                        default:
                                            totalNum += item.ButtonDisplayName
                                        }
                                    } else {
                                        switch item {
                                        case .clear:
                                            tempNum = 0
                                            totalNum = "0" // fix
                                            isEditing = false // fix
                                            isClear = true
                                        case .opposite:
                                            totalNum.insert("-", at: totalNum.startIndex)
                                        case .percent:
                                            totalNum = String(Double(totalNum)! / 100)
                                        case .equal:
                                            if calc.op == .clear {
                                                
                                            } else if calc.op == .divide && totalNum == "0" {
                                                totalNum = "오류"
                                                isEditing = false
                                                isClear = true
                                            } else {
                                                totalNum = String(calc.calculate(firstNum: tempNum, secondNum: Double(totalNum)!))
                                                if totalNum.hasSuffix(".0") {
                                                    totalNum.removeLast(2)
                                                }
                                                tempNum = Double(totalNum)!
                                                isEditing = false
                                                op = item
                                                calc.op = .clear
                                            }
                                        case .plus, .minus, .multiple, .divide:
                                            op = item
                                            calc.op = item
                                            isEditing = false
                                            isClear = false
                                        case .point:
                                            totalNum += "."
                                            isEditing = true
                                            isClear = false
                                        default:
                                            totalNum = item.ButtonDisplayName
                                            isEditing = true
                                            isClear = false
                                        }
                                    }
                                }
                            } label: {
                                Text(item.ButtonDisplayName)
                                    .bold()
                                    .frame(width: buttonWidth(button: item), height: buttonHeight(button: item))
                                    .background(item.backgroundColor)
                                    .cornerRadius(40)
                                    .foregroundColor(item.foregroundColor)
                                    .font(.system(size:33))
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    private func buttonWidth(button: ButtonType) -> CGFloat {
        switch button{
        case .zero: return (UIScreen.main.bounds.width - 5*10) / 4 * 2 + 10
        default: return (UIScreen.main.bounds.width - 5*10) / 4
        }
    }
    private func buttonHeight(button: ButtonType) -> CGFloat {
        return (UIScreen.main.bounds.width - 5*10) / 4
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
