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
    var authViewModel = AuthenticationViewModel()
    var viewModel = HomeViewModel()
    
    @State private var currentTab: Tab = .Health
    
    init(authViewModel: AuthenticationViewModel) {
        self.authViewModel = authViewModel
        UITabBar.appearance().backgroundColor = UIColor.init(red: 245/255, green: 247/255, blue: 251/255, alpha: 0.97)
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView {
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
                                    Color(.black/*red: 60/255, green: 64/255, blue: 198/255*/)
                                        .opacity(0.1)
                                        .cornerRadius(5)
                                    // blurring
                                        .blur(radius: 5)
                                        .padding(-7)
                                        .opacity(currentTab == tab ? 1 : 0)
                                )
                                .frame(maxWidth: .infinity)
                                .foregroundColor(currentTab == tab ? Color(.black/*red: 60/255, green: 64/255, blue: 198/255*/) : Color.black.opacity(0.3))
                        }
                    }
                }
                .padding([.horizontal, .top])
                .padding(.bottom, 10)
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarHidden(true)
            .background(Color(red: 241/255, green: 242/255, blue: 246/255).ignoresSafeArea())
        }
        .hiddenNavigationBarStyle()
    }
}



struct HealthView: View {
    var authViewModel = AuthenticationViewModel()
    var viewModel = HomeViewModel()
    
    var body: some View {
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
                            Image(insight.image)
                                .resizable()
                                .frame(width: 30, height: 30, alignment: .center)
                                .padding(5)
                            
                            Text(insight.title)
                                .foregroundColor(.gray)
//                                .font(.custom("Avenir-Medium", size: 17))
                                .font(.system(size: 17, weight: .bold, design: .default))
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
        //        .navigationTitle("Welcome Omer")
        .navigationBarBackButtonHidden(true)
    }
}

struct TipView: View {
    var tip: HomeTip
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                HStack(spacing: 10) {
                    Image(systemName: tip.image)
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(Color(red: 24/255, green: 210/255, blue: 167/255))
                    
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
