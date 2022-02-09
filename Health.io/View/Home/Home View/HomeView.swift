//
//  HomeView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/20/22.
//

import SwiftUI

struct HomeView: View {
    var authViewModel = AuthenticationViewModel()
    var viewModel = HomeViewModel()
    
    var body: some View {
        // Air Quality, Weather, Fitness tips, Diet Tips
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(viewModel.homeTips, id: \.self) { tip in
                            TipView(tip: tip)
                        }
                    }
                }
                .padding(10)
                
                HStack() {
                    Text("Health Insights")
                        .foregroundColor(.black)
                        .padding()
                        .font(.system(size: 27, weight: .bold, design: .default))
                    
                    Spacer()
                }
                
                ForEach(viewModel.healthInsigts, id: \.self) { insight in
                    ZStack {
                        Color.white
                        HStack {
                            Image(systemName: insight.image)
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(5)
                            
                            Text(insight.title)
                                .foregroundColor(.gray)
                                .font(.custom("Avenir-Medium", size: 17))
                                .padding(5)
                            
                            Spacer()
                            
                            Text("\(insight.value)")
                                .foregroundColor(.red)
                                .font(.custom("Avenir-Medium", size: 17))
                                .padding(.trailing, 1)
                            
                            Text("bpm")
                                .foregroundColor(.black)
                                .font(.custom("Avenir-Medium", size: 17))
                                .padding(.trailing, 5)
                        }
                        .padding(8)
                    }
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 10)
                    .padding(.bottom, 4)
                }
            }
        }
        .background(Color(red: 245/255, green: 247/255, blue: 251/255))
        .navigationTitle("Welcome Omer")
        .navigationBarBackButtonHidden(true)
    }
}

struct TipView: View {
    var tip: HomeTip
    
    var body: some View {
        ZStack {
            Color(red: 220/255, green: 239/255, blue: 252/255)
            VStack {
                HStack(spacing: 10) {
                    Image(systemName: tip.image)
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                    
                    Text(tip.title)
                        .minimumScaleFactor(0.7)
                        .font(.custom("Avenir-Medium", size: 24))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(20)
                
                Text(tip.description)
                    .font(.custom("Avenir-Medium", size: 17))
                    .foregroundColor(.black)
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
