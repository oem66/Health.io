//
//  HomeView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/20/22.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case Health = "heart.text.square"
    case Workout = "hammer.circle.fill"
    case Diet = "leaf.fill"
    case Profile = "person.crop.circle.fill"
}

struct HomeView: View {
    var viewModel = HomeViewModel()
    
    @State private var currentTab: Tab = .Health
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.init(red: 245/255, green: 247/255, blue: 251/255, alpha: 0.97)
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentTab) {
                HealthView()
                    .tag(Tab.Health)
                
                WorkoutView()
                    .tag(Tab.Workout)
                
                DietView()
                    .tag(Tab.Diet)
                
                ProfileView()
                    .tag(Tab.Profile)
            }
            .accentColor(.black)
            
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button {
                        currentTab = tab
                    } label: {
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                        // add shadow at background
                            .background(
                                Color(.black)
                                    .opacity(0.1)
                                    .cornerRadius(5)
                                // blurring
                                    .blur(radius: 5)
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color(.black) : Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 10)
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color(red: 241/255, green: 242/255, blue: 246/255).ignoresSafeArea())
    }
}
