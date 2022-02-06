//
//  HomeView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/20/22.
//

import SwiftUI

struct HomeView: View {
    var authViewModel = AuthenticationViewModel()
    var homeTips = [
        HomeTip(image: "lungs", title: "Air Quality", description: "Air Quality is important for your health"),
        HomeTip(image: "cloud.sun.bolt", title: "Weather, London", description: "Get latest weather forecast for London Area"),
        HomeTip(image: "pills", title: "Gym", description: "Get ripped as fuck as fast as possible"),
        HomeTip(image: "takeoutbag.and.cup.and.straw", title: "Diet", description: "Die plays key role in your general health and fitness level"),
    ]
    
    var body: some View {
        // Air Quality, Weather, Fitness tips, Diet Tips
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(homeTips, id: \.self) { tip in
                            TipView(tip: tip)
                        }
                    }
                }
                .padding(10)
            }
        }
        .navigationTitle("Welcome Omer")
        .navigationBarBackButtonHidden(true)
    }
}

struct TipView: View {
    var tip: HomeTip
    
    var body: some View {
        ZStack {
            Color.gray
            VStack {
                HStack(spacing: 10) {
                    Image(systemName: tip.image)
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                    
                    Text(tip.title)
                        .minimumScaleFactor(0.7)
                        .font(.custom("Avenir-Medium", size: 24))
                        .foregroundColor(.black)
                }
                .padding(.bottom, 10)
                
                Text(tip.description)
                    .font(.custom("Avenir-Medium", size: 17))
                    .foregroundColor(.black)
                    .lineLimit(5)
                    .padding()
            }
            .frame(width: 220, height: 280, alignment: .center)
            .padding(10)
        }
        .cornerRadius(12)
    }
}
