//
//  ButtonType.swift
//  SwiftUICalculator
//
//  Created by 이재희 on 2023/07/19.
//

import SwiftUI

enum ButtonType: String {
    case zero, one, two, three, four, five, six, seven, eight, nine
    case point, equal, plus, minus, multiple, divide
    case percent, opposite, clear
    
    var ButtonDisplayName: String {
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .point: return "."
        case .equal: return "="
        case .plus: return "+"
        case .minus: return "−"
        case .multiple: return "×"
        case .divide: return "÷"
        case .percent: return "%"
        case .opposite: return "⁺⧸₋"
        case .clear: return "C"
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .point:
            return Color("NumberButton")
        case .equal, .plus, .minus, .multiple, .divide:
            return Color.orange
        default:
            return Color.gray
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .percent, .opposite, .clear: return Color.black
        default: return Color.white
        }
    }
}
