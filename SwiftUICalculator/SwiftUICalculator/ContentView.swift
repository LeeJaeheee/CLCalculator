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
                                // fix : 숫자 9자리 이상 입력 안되게 (9자리 입력 후 +/-, %누른 경우만 예외)
                                // fix : = 누르면 같은 연산 반복 (+, -, *, -에 한해서)
                                // fix : 연속적으로 계산되게 구현 (ex) 3+3+3+3)
                                // fix : Double 범위 벗어나면 "오류" 표시
                                // fix : % 연산 후에도 clear 되지 않고 동작하도록 수정
//                                if totalNum.count >= 9 {
//                                    switch item {
//                                    case .clear:
//                                        tempNum = 0
//                                        totalNum = "0"
//                                        isEditing = false
//                                        isClear = true
//                                    case .opposite:
//                                        totalNum = String(Double(totalNum)! * -1)
//                                        tempNum = Double(totalNum)!
//                                    case .percent:
//                                        totalNum = String(Double(totalNum)! / 100)
//                                    case .plus, .minus, .multiple, .divide:
//                                    default: break
//                                    }
//                                }
                                if isClear {
                                    switch item {
                                    case .clear, .opposite, .percent, .equal:
                                        // fix: 함수로 만들기
                                        tempNum = 0
                                        totalNum = "0"
                                        isEditing = false
                                    case .plus, .minus, .multiple, .divide:
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
                                            totalNum = String(Double(totalNum)! * -1)
                                        case .percent:
                                            totalNum = String(Double(totalNum)! / 100)
                                            isEditing = false
                                            isClear = true // fix: 함수로 만들어서 totalNum, tempNum 0으로 초기화 시키기
                                        case .plus, .minus, .multiple, .divide:
                                            tempNum = Double(totalNum)!
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
                                                tempNum = Double(totalNum)!
                                                isEditing = false
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
                                            totalNum = String(Double(totalNum)! * -1)
                                            tempNum = Double(totalNum)!
                                        case .percent:
                                            totalNum = String(Double(totalNum)! / 100)
                                        case .equal:
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
                                        case .plus, .minus, .multiple, .divide:
                                            calc.op = item
                                            //isEditing = false
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
                                if totalNum.hasSuffix(".0") {
                                    totalNum.removeLast(2)
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
