//
//  IngredientCardView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 11. 6. 2022..
//

import SwiftUI

struct IngredientCardView: View {
    var body: some View {
        ZStack {
            Color(red: 246/255, green: 248/255, blue: 252/255)
            HStack {
                ZStack {
                    Color(.white)
                    VStack {
                        Image(systemName: "cart.fill")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                    }
                    .padding(5)
                }
                .clipped()
                .cornerRadius(10)
                .padding(3)
                
                VStack {
                    HStack {
                        Text("Coconut Oil")
                            .foregroundColor(.black)
                            .font(.custom("Avenir-Medium", size: 18))
                            .fontWeight(.heavy)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Cheap and easy to buy")
                            .foregroundColor(.gray)
                            .font(.custom("Avenir-Medium", size: 15))
                            .fontWeight(.bold)
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("1 spoon")
                        .font(.custom("Avenir-Medium", size: 15))
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                }
                .padding(3)
            }
        }
        .clipped()
        .cornerRadius(10)
    }
}
