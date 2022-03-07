//
//  AuthenticationView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/15/22.
//

import Foundation
import SwiftUI

struct AuthenticationView: View {
    var authModel = AuthenticationModel(image: AuthenticationConstants.shared.authPhoto, title: AuthenticationConstants.shared.title, description: AuthenticationConstants.shared.description)
    @StateObject private var authViewModel = AuthenticationViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white)
                VStack {
                    Spacer()
                    AuthenticationContentView(model: authModel)
                        .padding(.bottom, 30)
                    AuthenticationMiddleView(viewModel: authViewModel)
                        .padding()
                    Spacer()
                    BottomAuthenticationView(viewModel: authViewModel)
                        .padding(.bottom, 40)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct AuthenticationContentView: View {
    var model: AuthenticationModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Image(model.image)
                .resizable()
                .frame(width: 130, height: 130, alignment: .center)
            
            Text(model.title)
                .font(.custom("Avenir-Medium", size: 22))
                .fontWeight(.bold)
                .minimumScaleFactor(0.5)
            
            Text(model.description)
                .font(.custom("Avenir-Medium", size: 15))
                .fontWeight(.medium)
                .foregroundColor(.gray)
                .minimumScaleFactor(0.5)
        }
        .padding(20)
    }
}

struct AuthenticationMiddleView: View {
    var viewModel: AuthenticationViewModel
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ButtonView(viewModel: viewModel, buttonTittle: "apple_auth", logo: "apple_logo", textColor: .white, color: .black, actionResponse: "Apple Sign In tapped!", borderColor: .black, authType: .Apple)
            ButtonView(viewModel: viewModel, buttonTittle: "google_auth", logo: "google_logo", textColor: .gray, color: .white, actionResponse: "Google Sign In tapped!", borderColor: .gray, authType: .Google)
            ButtonView(viewModel: viewModel, buttonTittle: "facebook_auth", logo: "facebook_logo", textColor: .blue, color: .white, actionResponse: "Continue with Facebook", borderColor: .blue, authType: .Facebook)
        }
    }
}

enum AuthType { case Apple, Facebook, Google }

struct ButtonView: View {
    var viewModel: AuthenticationViewModel
    @State private var forwardToHome = false
    
    var buttonTittle: String
    var logo: String
    var textColor: Color
    var color: Color
    var actionResponse: String
    var borderColor: Color
    var authType: AuthType
    
    var body: some View {
        Button {
            debugPrint(actionResponse)
            switch authType {
            case .Apple:
                debugPrint("Sign in with Apple from Switch")
            case .Facebook:
                debugPrint("Sign in with Facebook from Switch")
            case .Google:
                viewModel.SignInWithGoogle {
                    viewModel.saveAuthStateToKeychain(state: true)
                    forwardToHome = true
                }
            }
        } label: {
            ZStack {
                Color(UIColor(color))
                HStack {
                    Image(logo)
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                        .padding(.leading, 10)
                    Spacer()
                    Text(LocalizedStringKey(buttonTittle))
                        .font(.custom("Avenir-Medium", size: 20))
                        .foregroundColor(textColor)
                        .fontWeight(.bold)
                    Spacer()
                }
            }
        }
        .frame(width: .infinity, height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(borderColor, lineWidth: 2)
        )
        .cornerRadius(10)
        NavigationLink(destination: HomeView()/*HomeView(authViewModel: viewModel)*/, isActive: $forwardToHome) { }
    }
}

struct BottomAuthenticationView: View {
    var viewModel: AuthenticationViewModel
    @State var anonymously = false
    
    var body: some View {
        Button {
            viewModel.signinAnonymously = true
            anonymously = viewModel.signinAnonymously
            viewModel.signInAnonymously()
            viewModel.saveAuthStateToKeychain(state: true)
        } label: {
            VStack {
                Text(LocalizedStringKey("sign_up_text"))
                    .foregroundColor(.black)
                    .font(.custom("Avenir-Medium", size: 15))
                    .fontWeight(.medium)
                
                Text("create_an_account")
                    .font(.custom("Avenir-Medium", size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 24/255, green: 210/255, blue: 167/255))
            }
        }
        NavigationLink(destination: HomeView()/*HomeView(authViewModel: viewModel)*/, isActive: $anonymously) { }
    }
}
