//
//  AirQualityView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/3/22.
//

import SwiftUI

struct AirQualityView: View {
    private var viewModel = AirQualityViewModel()
    
    var body: some View {
        ZStack {
            Color(.yellow)
            VStack {
                Text("Air Quality View")
                    .foregroundColor(.black)
                    .padding()
            }
            .onAppear {
//                viewModel.fetchAQIData {
//                    debugPrint("Data from AirQualityView: \(viewModel.airQualityData)")
//                }
            }
        }
    }
}
