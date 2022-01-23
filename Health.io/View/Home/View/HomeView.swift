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

// MARK: Use this View to show all available health data
struct HealthCardView: View {
    var body: some View {
        Text("Health Card View")
            .padding()
    }
}
