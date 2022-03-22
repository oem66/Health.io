//
//  DietView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/9/22.
//

import Foundation
import SwiftUI

struct DietView: View {
    var body: some View {
        let columns = [GridItem(.flexible(maximum: 250)),
                       GridItem(.flexible(maximum: 250))]
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 5, content: {
                    ForEach((0...25), id: \.self) { _ in
                        NavigationLink(destination: Text("Test")) {
                            DietCardView(image: "fruit", level: "Breakfast", title: "Get Muscle Loose Fat", duration: "15 min")
                                .padding()
                        }
                    }
                })
            }
            .navigationTitle("Diet")
        }
    }
}

struct DietTopSection: View {
    var body: some View {
        VStack {
            
        }
    }
}

struct DietCardView: View {
    @State var image: String
    @State var level: String
    @State var title: String
    @State var duration: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 220, alignment: .center)
                .cornerRadius(5.0)
                .padding(.bottom, 5)
            
            Text(level)
                .foregroundColor(.blue)
                .fontWeight(.heavy)
            
            Text(title)
                .bold()
                .foregroundColor(.black)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            
            Text(duration)
                .foregroundColor(.gray)
                .bold()
        }
    }
}
