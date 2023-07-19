//
//  ContentView.swift
//  SwiftUICalculator
//
//  Created by 이재희 on 2023/07/18.
//

import SwiftUI

struct ContentView: View {
    
    @State private var totalNumber: String = "0"
    
    @State var tempNum: Double = 0
    @State var op: ButtonType = .clear
    @State var calc = Calculator(_op: .clear)
    @State var isEditing: Bool = false
    
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
                    Text(totalNumber)
                        .padding()
                        .font(.system(size: 75))
                        .foregroundColor(.white)
                }
                
                ForEach(buttonData, id: \.self) { line in
                    HStack {
                        ForEach(line, id: \.self) { item in
                            Button {
                                if !isEditing {
                                    if item == .clear {
                                        totalNumber = "0"
                                    } else if [.plus, .minus, .multiple, .divide].contains(item) {
                                        if totalNumber == "0" {
                                            totalNumber = "error"
                                        }
                                    } else {
                                        totalNumber = item.ButtonDisplayName
                                        isEditing = true
                                    }
                                } else {
                                    if item == .clear {
                                        totalNumber = "0"
                                        isEditing = false
                                    } else if [.plus, .minus, .multiple, .divide].contains(item) {
                                        tempNum = Double(totalNumber) ?? 0
                                        op = item
                                        calc.op = item
                                        isEditing = false
                                        //버튼색변경
                                    } else if item == .equal {
                                        totalNumber = String(calc.calculate(firstNum: tempNum, secondNum: Double(totalNumber) ?? 0))
                                        if totalNumber.hasSuffix(".0") {
                                            totalNumber.removeLast(2)
                                        }
                                        tempNum = Double(totalNumber) ?? 0
                                        isEditing = false
                                    } else {
                                        totalNumber += item.ButtonDisplayName
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
