//
//  HomeView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/20/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(uiColor: .green)
            Text("Home View")
                .padding()
            HealthCardView()
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: Health Highlights View to show 3 main health previews
struct HealthHighlightsView: View {
    var body: some View {
        ZStack {
            Color(.white)
            VStack(alignment: .center, spacing: 5) {
                Image(systemName: "")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                
                Text("85 bpm")
                    .foregroundColor(.black)
                    .padding()
                
                HStack {
                    Image(systemName: "")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .padding(.trailing, 5)
                    
                    Text("5% Less Than Last month")
                        .foregroundColor(.black)
                        .padding()
                }
                
                ZStack {
                    Color(red: 232/255, green: 255/255, blue: 246/255)
                    Text("30 min Ago")
                        .foregroundColor(.green)
                        .padding()
                }
                
                HStack(alignment: .center) {
                    
                }
            }
        }
        .cornerRadius(20)
    }
}

// MARK: Use this View to show all available health data
struct HealthCardView: View {
    var body: some View {
        Text("Health Card View")
            .foregroundColor(.black)
            .padding()
    }
}
