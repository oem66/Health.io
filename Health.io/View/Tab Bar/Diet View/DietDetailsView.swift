//
//  DietDetailsView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 4/7/22.
//

import SwiftUI

struct DietDetailsView: View {
    var body: some View {
        VStack {
            TopDietView()
        }
    }
}

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
                .padding(.bottom, 5)
                
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
                    Text("760 Cal")
                        .font(.custom("Avenir-Medium", size: 18))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.trailing, 3)
                    
                    Text("75g Protein")
                        .font(.custom("Avenir-Medium", size: 18))
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        .padding(.trailing, 3)
                    
                    Text("350g Carbs")
                        .font(.custom("Avenir-Medium", size: 18))
                        .foregroundColor(.orange)
                        .fontWeight(.bold)
                        .padding(.trailing, 3)
                    
                    Text("65g Fat")
                        .font(.custom("Avenir-Medium", size: 18))
                        .foregroundColor(.red)
                        .fontWeight(.bold)
                        .padding(.trailing, 3)
                    Spacer()
                }
                .padding([.leading, .trailing, .bottom], 15)
            }
        }
        .frame(width: .infinity, height: 300, alignment: .center)
    }
}
