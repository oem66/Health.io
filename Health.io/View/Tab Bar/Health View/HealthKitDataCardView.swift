//
//  HealthKitDataCardView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 4/11/22.
//

import SwiftUI

struct HealthKitDataCardView: View {
    var data: HealthKitData?
    
    var body: some View {
        let columns = [GridItem(.flexible(maximum: 250)),
                       GridItem(.flexible(maximum: 250))]
        LazyVGrid(columns: columns, spacing: 5, content: {
            ForEach((0...3), id: \.self) { _ in
                NavigationLink(destination: Text("Test")) {
                    HealthCardView(image: "health", title: "Heart Rate", data: "75", measureUnit: "bpm")
                        .padding(2)
                }
            }
        })
    }
}
