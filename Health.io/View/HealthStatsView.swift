//
//  HealthStatsView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/10/22.
//

import Foundation
import SwiftUI

struct HealthStatsView: View {
    private var viewModel = HealthViewModel()
    private var covidViewModel = Covid19ViewModel()
    
    private var healthSymbols = ["heart.text.square", "heart", "brain", "facemask", "bed.double", "allergens", "pills", "ear", "waveform.path.ecg.rectangle", "staroflife", "waveform.path.ecg"]
    private var colors: [Color] = [.yellow, .red, .blue, .purple, .green]
    @State var gridLayout = [GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5), GridItem(.flexible(), spacing: 5)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 10) {
                    ForEach(healthSymbols, id: \.self) { symbol in
                        Image(systemName: symbol)
                            .font(.system(size: 40))
                            .frame(minWidth: 0, maxWidth: .infinity , minHeight: 50)
                            .background(colors[Int.random(in: 0...4)])
                            .cornerRadius(10)
                    }
                }
            }
            .onAppear {
                viewModel.readHealthData()
                covidViewModel.fetchCovid19Data {
                    debugPrint("DATA: \(covidViewModel.covid19Data)")
                }
            }
        }
    }
}
