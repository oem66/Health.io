//
//  HealthCardView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/25/22.
//

import SwiftUI

struct HealthCardView: View {
    @State var image: String
    @State var title: String
    @State var data: String
    @State var measureUnit: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                
                Text(title)
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .font(.custom("Avenir-Medium", size: 22))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
                Spacer()
            }
            .padding([.leading, .trailing, .top])
            
            HStack {
                Text(data)
                    .foregroundColor(.gray)
                    .fontWeight(.heavy)
                    .font(.custom("Avenir-Medium", size: 17))
                
                Text(measureUnit)
                    .foregroundColor(.gray)
                    .fontWeight(.heavy)
                    .font(.custom("Avenir-Medium", size: 17))
                
                Spacer()
            }
            .padding([.leading, .trailing, .bottom])
        }
        .background(.white)
        .cornerRadius(8.0)
    }
}
