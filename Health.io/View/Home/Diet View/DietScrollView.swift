//
//  DietScrollView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 3/30/22.
//

import SwiftUI

struct DietScrollView: View {
    var viewModel: DietViewModel
    var sectionTitle: String
    var sectionTitleColor: Color
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                Text(sectionTitle)
                    .foregroundColor(sectionTitleColor)
                    .font(.custom("Avenir-Medium", size: 25))
                    .fontWeight(.heavy)
                Spacer()
            }
            .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.fastingDiets, id: \.self) { fasting in
                        NavigationLink(destination: Text("Test")) {
                            DietScrollViewCard(model: fasting, titleColor: sectionTitleColor)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

struct DietScrollViewCard: View {
    var model: FastingDietModel
    var titleColor: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(model.image)
                .resizable()
                .cornerRadius(10)
                .frame(width: 270, height: 165, alignment: .center)
            
            Text(model.title)
                .foregroundColor(titleColor)
                .fontWeight(.heavy)
            
            Text(model.description)
                .bold()
                .foregroundColor(.black)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
        }
    }
}
