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
        
        ScrollView(.vertical) {
            HStack {
                Text("Diet")
                    .foregroundColor(.black)
                    .bold()
                    .font(.custom("Avenir-Medium", size: 40))
                    .padding([.leading, .bottom], 7)
                    .padding(.top, 20)
                Spacer ()
            }
            
            LazyVGrid(columns: columns, spacing: 5, content: {
                ForEach((0...25), id: \.self) { _ in
                    NavigationLink(destination: Text("Test")) {
                        DietWorkoutCardView(image: "bodybuilder", level: "Beginner", title: "Get Muscle Loose Fat", duration: "60 min")
                            .padding()
                    }
                }
            })
        }
    }
}

struct DietTopSection: View {
    var body: some View {
        VStack {
            
        }
    }
}

struct DietWorkoutCardView: View {
    @State var image: String
    @State var level: String
    @State var title: String
    @State var duration: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .frame(width: 170, height: 220, alignment: .center)
                .cornerRadius(5.0)
                .padding(.bottom, 5)
            
            Text(level)
                .bold()
                .foregroundColor(.blue)
            
            Text(title)
                .bold()
                .foregroundColor(.black)
            
            Text(duration)
                .foregroundColor(.gray)
        }
    }
}
