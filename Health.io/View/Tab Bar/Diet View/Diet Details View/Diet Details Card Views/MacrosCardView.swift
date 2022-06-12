//
//  MacrosCardView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 11. 6. 2022..
//

import SwiftUI

enum AllMacros {
    case Calories(String)
    case Protein(String)
    case Carbs(String)
    case Fat(String)
}

struct MacrosCardView: View {
    var amount: Int
    var macroName: AllMacros
    var unit: String
    var color: Color
    
    var body: some View {
        VStack {
            HStack {
                switch macroName {
                case .Calories(let string):
                    MacroView(macroName: string)
                case .Protein(let string):
                    MacroView(macroName: string)
                case .Carbs(let string):
                    MacroView(macroName: string)
                case .Fat(let string):
                    MacroView(macroName: string)
                }
                Spacer()
            }
            
            HStack {
                Text("\(amount)\(unit)")
                    .font(.custom("Avenir-Medium", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(color)
                Spacer()
            }
        }
    }
}
