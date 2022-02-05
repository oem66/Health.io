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
        ZStack {
            Color.red
            ScrollView(.vertical) {
                VStack {
                    ScrollView(.horizontal) {
                        ForEach(homeTips, id: \.self) { tip in
                            NavigationLink(destination: Text(tip.title)) {
                                VStack {
                                    HStack {
                                        Image(systemName: tip.image)
                                            .padding()
                                        Text(tip.title)
                                            .foregroundColor(.black)
                                            .padding()
                                    }
                                }
                            }
                        }
                    }
                }
                
                Text("Test")
                    .foregroundColor(.black)
                    .padding()
                Text("Test")
                    .foregroundColor(.black)
                    .padding()
            }
            .navigationTitle("Welcome, Omer")
            .onAppear {
                if authViewModel.signinAnonymously {
                    authViewModel.signInAnonymously()
                }
            }
            //            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
        }
        .edgesIgnoringSafeArea(.all)
        //        ZStack {
        //            Color(red: 242/255, green: 246/255, blue: 254/255)
        //            VStack(alignment: .center) {
        //                Text("Home View")
        //                    .padding(5)
        //
        //                AirQualityView()
        //                    .padding(5)
        //
        //                HealthHighlightsView()
        //                    .padding(5)
        //
        //                HealthCardView()
        //                    .padding(5)
        //                Spacer()
        //            }
        //        }
        //        .onAppear {
        //            if authViewModel.signinAnonymously {
        //                authViewModel.signInAnonymously()
        //            }
        //        }
        //        .edgesIgnoringSafeArea(.all)
        //        .navigationBarBackButtonHidden(true)
    }
}
