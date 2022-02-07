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
    
    var healthInsigts = [
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6),
        HealthInsight(image: "staroflife", title: "Heart Rate", value: 75.6)
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
                
                HStack() {
                    Text("Health Insights")
                        .foregroundColor(.black)
                        .font(.custom("Avenir-Medium", size: 27))
                        .padding()
                    
                    Spacer()
                }
                
                ForEach(healthInsigts, id: \.self) { insight in
                    ZStack {
                        Color(red: 246/255, green: 248/255, blue: 250/255)
                        HStack {
                            Image(systemName: insight.image)
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                                .padding(5)
                            
                            Text(insight.title)
                                .foregroundColor(.gray)
                                .font(.custom("Avenir-Medium", size: 17))
                                .padding(5)
                            
                            Spacer()
                            
                            Text("\(insight.value)")
                                .foregroundColor(.red)
                                .font(.custom("Avenir-Medium", size: 17))
                                .padding(.trailing, 5)
                        }
                        .padding(8)
                    }
                    .cornerRadius(10)
                    .padding([.leading, .trailing, .bottom], 10)
                }
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
            Color(red: 24/255, green: 210/255, blue: 167/255)
            VStack {
                HStack(spacing: 10) {
                    Image(systemName: tip.image)
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                    
                    Text(tip.title)
                        .minimumScaleFactor(0.7)
                        .font(.custom("Avenir-Medium", size: 24))
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(20)
                
                Text(tip.description)
                    .font(.custom("Avenir-Medium", size: 17))
                    .foregroundColor(.white)
                    .lineLimit(5)
                    .padding()
                
                Spacer()
            }
            .frame(width: 190, height: 230, alignment: .center)
            .padding(10)
        }
        .cornerRadius(12)
    }
}
