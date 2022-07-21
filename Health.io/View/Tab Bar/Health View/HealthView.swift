//
//  HealthView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 4/7/22.
//

import SwiftUI

struct HealthView: View {
    private var viewModel = HealthViewModel()
    private var airVM = AirQualityViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(viewModel.healthTips, id: \.self) { model in
                        NavigationLink(destination: Text("Text")) {
                            HealthTopTipsView(model: model)
                                .padding([.bottom, .leading, .trailing])
                        }
                    }
                    
                    HealthKitDataCardView()
                        .padding([.leading, .trailing])
                    
                    Spacer()
                }
            }
            .onAppear {
                viewModel.readHealthData()
                viewModel.fetchHealthData()
                
//                airVM.getAirQualityData() // LIMITED API CALLS
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
        HStack {
            Image(model.image)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .padding()
            
            Spacer()
            
            HStack {
                Text(LocalizedStringKey(model.title))
                    .foregroundColor(.gray)
                    .font(.custom("Avenir-Medium", size: 17))
                    .fontWeight(.heavy)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                Spacer()
            }
            
            Spacer()
            
            Image(systemName: "arrow.right")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .padding()
        }
        .background(Color.white)
        .cornerRadius(8)
    }
}

struct HealthTopTipSubtitle: View {
    var model: HealthTip
    
    var body: some View {
        HStack {
            Image(model.image)
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .padding()
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Text(LocalizedStringKey(model.title))
                        .foregroundColor(.gray)
                        .font(.custom("Avenir-Medium", size: 17))
                        .fontWeight(.heavy)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    
                    Text(LocalizedStringKey(model.subtitle ?? "No Subtitle"))
                        .foregroundColor(.gray)
                        .font(.custom("Avenir-Medium", size: 12))
                    
                    Spacer()
                }
                Spacer()
            }
            
            Spacer()
            
            Image(systemName: "arrow.right")
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
                .padding()
        }
        .background(Color.white)
        .cornerRadius(8)
    }
}

struct HealthTopTipImageSubtitle: View {
    var model: HealthTip
    
    var body: some View {
        ZStack {
            HStack {
                Image(model.image)
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .padding()
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 3) {
                    Spacer()
                    Text(LocalizedStringKey(model.title))
                        .foregroundColor(.gray)
                        .font(.custom("Avenir-Medium", size: 17))
                        .fontWeight(.heavy)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    
                    HStack(spacing: 3) {
                        Image(systemName: model.subtitleImage ?? "exclamationmark.octagon")
                            .resizable()
                            .frame(width: 15, height: 15, alignment: .center)
                        
                        Text(LocalizedStringKey(model.subtitle ?? "No Subtitle"))
                            .foregroundColor(.gray)
                            .font(.custom("Avenir-Medium", size: 12))
                            .lineLimit(3)
                        Spacer()
                    }
                    Spacer()
                }
                
                Spacer()
                
                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 15, height: 15, alignment: .center)
                    .padding()
            }
            .background(Color.white)
            .cornerRadius(8)
        }
    }
}
