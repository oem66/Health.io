//
//  HealthKitDataCardView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 4/11/22.
//

import SwiftUI

struct HealthKitDataCardView: View {
    @StateObject var viewModel = HealthViewModel()
    
    var body: some View {
        let columns = [GridItem(.flexible(maximum: 250)),
                       GridItem(.flexible(maximum: 250))]
        LazyVGrid(columns: columns, spacing: 5, content: {
            ForEach(viewModel.healthKitData, id: \.self) { healthData in
                HealthCardView(image: healthData.image, title: healthData.title, data: String("\(healthData.data)"), measureUnit: healthData.unit)
                    .padding(2)
            }
            .onAppear {
                viewModel.fetchHealthData()
            }
        })
    }
}
