//
//  TopDietView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 11. 6. 2022..
//

import SwiftUI

struct TopDietView: View {
    var body: some View {
        ZStack {
            Image("food1")
                .resizable()
                .frame(width: .infinity, height: .infinity, alignment: .center)
                .edgesIgnoringSafeArea(.top)
                .brightness(-0.30)
            
            VStack(alignment: .leading) {
                Spacer()
                
                HStack {
                    Text("4.7")
                        .font(.custom("Avenir-Medium", size: 18))
                        .foregroundColor(.orange)
                        .fontWeight(.bold)
                    
                    Text("(258)")
                        .font(.custom("Avenir-Medium", size: 18))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.leading, 15)
                
                VStack(alignment: .leading) {
                    Text("Spaghetti and Meatballs")
                        .font(.custom("Avenir-Medium", size: 25))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text("ONCE UPON A CHEF")
                        .font(.custom("Avenir-Medium", size: 22))
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                }
                .padding(.leading, 15)
                .padding(.bottom, 5)
                
                HStack {
                    MacrosCardView(amount: 760, macroName: .Calories("Calories"), unit: "cal", color: .purple)
                    MacrosCardView(amount: 75, macroName: .Protein("Protein"), unit: "g", color: .blue)
                    MacrosCardView(amount: 350, macroName: .Carbs("Carbs"), unit: "g",color: .orange)
                    MacrosCardView(amount: 65, macroName: .Fat("Fat"), unit: "g",color: .red)
                    Spacer()
                }
                .padding([.leading, .trailing, .bottom], 15)
            }
        }
        .frame(width: .infinity, height: 180, alignment: .center)
    }
}
