//
//  DietHealthTips.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 3/29/22.
//

import SwiftUI

struct DietHealthTipsView: View {
    var dietHealthTips: [DietHealthTipsModel]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(dietHealthTips, id: \.self) { tip in
                    NavigationLink(destination: Text("Test")) {
                        DietHealthTipCard(model: tip)
                            .padding(10)
                    }
                }
            }
        }
    }
}

struct DietHealthTipCard: View {
    var model: DietHealthTipsModel
    
    var body: some View {
        ZStack {
            Image(model.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 200, alignment: .center)
                .cornerRadius(10)
                .brightness(-0.35)
            
            VStack(alignment: .center) {
                Text(model.title)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.custom("Avenir-Medium", size: 35))
                    .padding()
                
                Text(model.description)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.custom("Avenir-Medium", size: 21))
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .padding()
            }
            .frame(width: 300, height: 200, alignment: .center)
        }
        .cornerRadius(10)
    }
}
