//
//  MacroView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 11. 6. 2022..
//

import SwiftUI

struct MacroView: View {
    var macroName: String
    
    var body: some View {
        Text(macroName)
            .font(.custom("Avenir-Medium", size: 18))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}
