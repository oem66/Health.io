//
//  HomeView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/20/22.
//

import SwiftUI

struct HomeView: View {
    var authViewModel: AuthenticationViewModel
    
    var body: some View {
        ZStack {
            Color(red: 242/255, green: 246/255, blue: 254/255)
            VStack(alignment: .center) {
                Text("Home View")
                    .padding(5)
                
                HealthHighlightsView()
                    .padding(5)
                
                HealthCardView()
                    .padding(5)
                Spacer()
            }
        }
        .onAppear {
            authViewModel.signInAnnonymously()
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}
