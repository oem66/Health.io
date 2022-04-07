//
//  HealthView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 4/7/22.
//

import SwiftUI

struct HealthView: View {
    private var viewModel = HealthViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(viewModel.healthTips, id: \.self) { model in
                        HealthTopTipsView(model: model)
                    }
                }
            }
            .navigationTitle("Home")
            .background(Color(red: 245/255, green: 247/255, blue: 251/255))
        }
    }
}

enum TypeOfView {
    case titleOnlyView
    case titleSubtitleView
}

struct HealthTopTipsView: View {
    var model: HealthTip
    
    var body: some View {
        if model.type == .noSubtitle {
            HealthTopTipNoSubtitle(model: model)
                .cornerRadius(8)
        } else if model.type == .subtitleImage {
            HealthTopTipImageSubtitle(model: model)
                .cornerRadius(8)
        } else if model.type == .subtitle {
            HealthTopTipSubtitle(model: model)
                .cornerRadius(8)
        }
    }
}

struct HealthTopTipNoSubtitle: View {
    var model: HealthTip
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Image(model.image)
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                
                VStack(alignment: .leading) {
                    Text(model.title)
                        .foregroundColor(.black)
                        .font(.custom("Avenir-Medium", size: 15))
                        .padding(.bottom)
                }
                
                Spacer()
                
                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .center)
            }
            .padding(10)
        }
        .background(Color.white)
        .padding(10)
        .cornerRadius(8)
    }
}

struct HealthTopTipSubtitle: View {
    var model: HealthTip
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                Image(model.image)
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                
                VStack(alignment: .leading) {
                    Text(model.title)
                        .foregroundColor(.black)
                        .font(.custom("Avenir-Medium", size: 15))
                        .padding(.bottom)
                    
                    Text(model.subtitle ?? "No Subtitle")
                        .foregroundColor(.black)
                        .font(.custom("Avenir-Medium", size: 10))
                        .padding(.bottom)
                }
                
                Spacer()
                
                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .center)
            }
        }
        .background(Color.white)
        .padding(10)
        .cornerRadius(8)
    }
}

struct HealthTopTipImageSubtitle: View {
    var model: HealthTip
    
    var body: some View {
        ZStack{
            VStack {
                HStack(spacing: 8) {
                    Image(model.image)
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        Text(model.title)
                            .foregroundColor(.black)
                            .font(.custom("Avenir-Medium", size: 15))
                            .padding(.bottom)
                        
                        HStack(spacing: 3) {
                            Image(model.subtitleImage ?? "exclamationmark.octagon")
                                .resizable()
                                .frame(width: 15, height: 15, alignment: .center)
                            Text(model.subtitle ?? "No Subtitle")
                                .foregroundColor(.black)
                                .font(.custom("Avenir-Medium", size: 10))
                                .padding(.bottom)
                        }
                    }
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                        .resizable()
                        .frame(width: 15, height: 15, alignment: .center)
                }
            }
            .background(Color.white)
            .padding(10)
        }
    }
}
