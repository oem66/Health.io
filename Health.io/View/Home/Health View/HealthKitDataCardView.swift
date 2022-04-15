//
//  HealthKitDataCardView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 4/11/22.
//

import SwiftUI

struct HealthKitDataCardView: View {
    private var columns = [GridItem(.flexible(maximum: 250)),
                  GridItem(.flexible(maximum: 250))]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 5, content: {
            ForEach((0...3), id: \.self) { _ in
                NavigationLink(destination: Text("Test")) {
                    HealthCardView(image: "fruit", level: "Breakfast", title: "Get Muscle Loose Fat", duration: "15 min")
                        .padding()
                }
            }
        })
    }
}
