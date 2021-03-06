//
//  OnboardingView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/6/22.
//

import SwiftUI

struct OnboardingView: View {
    private var onboardingElements: [OnboardingModel] = [
        OnboardingModel(image: OnboardingConstants.shared.health, title: "health_title", description: "health_description"),
        OnboardingModel(image: OnboardingConstants.shared.fasting, title: "fasting_title", description: "fasting_description"),
        OnboardingModel(image: OnboardingConstants.shared.workout, title: "workout_title", description: "workout_description"),
        OnboardingModel(image: OnboardingConstants.shared.diet, title: "diet_title", description: "diet_description")
    ]
    
    @State private var showAuthView = false
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                TabView {
                    ForEach(onboardingElements) {
                        OnboardingElementView(image: $0.image, title: $0.title, description: $0.description)
                            .padding()
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: 580)
                .tabViewStyle(.page)
                
                Spacer()
                
                Button {
                    withAnimation { showAuthView.toggle() }
                } label: {
                    Text(LocalizedStringKey("get_started"))
                        .font(.custom("Avenir-Medium", size: 20))
                        .fontWeight(.bold)
                        .padding(.vertical, 18)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(.black)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                        .foregroundColor(.white)
                }
                .padding([.top, .leading, .trailing], 20)
                .padding(.bottom, 50)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .overlay(
            Group {
                if showAuthView { AuthenticationView().transition(.move(edge: .bottom)) }
            }
        )
    }
}

struct OnboardingElementView: View {
    var image: String
    var title: String
    var description: String
    
    var body: some View {
        ZStack {
            VStack {
                Text(LocalizedStringKey(title))
                    .font(.custom("Avenir-Medium", size: 20))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .padding([.leading, .trailing], 20)
                    .minimumScaleFactor(0.5)
                
                Text(LocalizedStringKey(description))
                    .font(.custom("Avenir-Medium", size: 16))
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
                    .padding(.bottom, 50)
                    .padding([.leading, .trailing, .top], 20)
                    .minimumScaleFactor(0.5)
                
                Image(image)
                    .resizable()
                    .frame(width: 250, height: 250, alignment: .center)
                    .padding()
                    .padding(.bottom, 30)
            }
        }
        .clipped()
        .cornerRadius(15.0)
    }
}
