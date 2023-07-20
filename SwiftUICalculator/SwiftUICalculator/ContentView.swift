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
                        .lineLimit(1)
                        .minimumScaleFactor(0.05)
                }
                
                ForEach(buttonData, id: \.self) { line in
                    HStack {
                        ForEach(line, id: \.self) { item in
                            Button {
                                switch item {
                                case .clear:
                                   clear()
                                case .opposite:
                                    if isClear {
                                        clear()
                                    } else if isEditing {
                                        totalNum = String(Double(totalNum)! * -1)
                                    } else {
                                        totalNum = String(Double(totalNum)! * -1)
                                    }
                                case .percent:
                                    if isClear {
                                        clear()
                                    } else if isEditing {
                                        totalNum = String(Double(totalNum)! / 100)
                                        tempNum = Double(totalNum)!
                                        isEditing = false
                                    } else {
                                        totalNum = String(Double(totalNum)! / 100)
                                        tempNum = Double(totalNum)!
                                    }
                                case .point:
                                    if isClear {
                                        totalNum += "."
                                        startEditing()
                                    } else if isEditing {
                                        totalNum = totalNum.contains(".") ? totalNum : totalNum + "."
                                    } else {
                                        totalNum = totalNum.contains(".") ? "0." : totalNum + "."
                                        isEditing = true
                                    }
                                case .plus, .minus, .multiple, .divide:
                                    if isClear {
                                        calc.op = item
                                        isEditing = false
                                        isClear = false
                                    } else if isEditing {
                                        totalNum = String(calc.calculate(firstNum: tempNum, secondNum: Double(totalNum)!))
                                        tempNum = Double(totalNum)!
                                        calc.op = item
                                        isEditing = false
                                    } else {
                                        calc.op = item
                                    }
                                case .equal:
                                    if isClear {
                                        clear()
                                    } else if isEditing {
                                        if calc.op == .clear {
                                            
                                        } else if calc.op == .divide && totalNum == "0" {
                                            totalNum = "오류"
                                            isEditing = false
                                            isClear = true
                                        } else {
                                            totalNum = String(calc.calculate(firstNum: tempNum, secondNum: Double(totalNum)!))
                                            tempNum = Double(totalNum)!
                                            isEditing = false
                                            calc.op = .clear // fix
                                        }
                                    } else {
                                        if calc.op == .clear {
                                            
                                        } else if calc.op == .divide && totalNum == "0" {
                                            totalNum = "오류"
                                            //isEditing = false
                                            isClear = true
                                        } else {
                                            totalNum = String(calc.calculate(firstNum: tempNum, secondNum: Double(totalNum)!))
                                            tempNum = Double(totalNum)!
                                            //isEditing = false
                                            calc.op = .clear
                                        }
                                    }
                                default:
                                    if isClear {
                                        totalNum = item.ButtonDisplayName
                                        startEditing()
                                    } else if isEditing {
                                        totalNum += item.ButtonDisplayName
                                    } else {
                                        totalNum = item.ButtonDisplayName
                                        isEditing = true
                                    }
                                }
                                
                                func clear() {
                                    tempNum = 0
                                    totalNum = "0"
                                    isClear = true
                                    isEditing = false
                                }
                                
                                func startEditing() {
                                    isEditing = true
                                    isClear = false
                                }
                                
                                func checkSuffix() {
                                    if totalNum.hasSuffix(".0") {
                                        totalNum.removeLast(2)
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
