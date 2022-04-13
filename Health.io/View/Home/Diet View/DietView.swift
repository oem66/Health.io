//
//  DietView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/9/22.
//

import Foundation
import SwiftUI

struct DietView: View {
    private var viewModel = DietViewModel()
    
    var body: some View {
        let columns = [GridItem(.flexible(maximum: 250)),
                       GridItem(.flexible(maximum: 250))]
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                DietHealthTipsView(viewModel: viewModel)
                    .padding()
                
                DietScrollView(viewModel: DietViewModel(), sectionTitle: "FASTING", sectionTitleColor: .green)
                    .padding()
                
                DietScrollView(viewModel: DietViewModel(), sectionTitle: "BALANCED", sectionTitleColor: .blue)
                    .padding()
                
                DietScrollView(viewModel: DietViewModel(), sectionTitle: "KETO/LOW CARB", sectionTitleColor: .orange)
                    .padding()
                
                DietScrollView(viewModel: DietViewModel(), sectionTitle: "HIGH PROTEIN", sectionTitleColor: .red)
                    .padding()
                
                LazyVGrid(columns: columns, spacing: 5, content: {
                    ForEach((0...25), id: \.self) { _ in
                        NavigationLink(destination: Text("Test")) {
                            DietCardView(image: "fruit", level: "Breakfast", title: "Get Muscle Loose Fat", duration: "15 min")
                                .padding()
                        }
                    }
                })
                Spacer()
            }
            .navigationTitle("Diet")
            .background(Color(red: 245/255, green: 247/255, blue: 251/255))
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
