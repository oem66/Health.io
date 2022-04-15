//
//  HealthCardView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/25/22.
//

import SwiftUI

struct HealthCardView: View {
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
