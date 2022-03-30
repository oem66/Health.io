//
//  FastingDietPlans.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 3/30/22.
//

import SwiftUI

struct FastingDietPlansView: View {
    var viewModel = FastingDietViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("FASTING")
                    .foregroundColor(.black)
                    .font(.custom("Avenir-Medium", size: 25))
                    .fontWeight(.heavy)
                Spacer()
            }
            .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.fastingDiets, id: \.self) { fasting in
                        NavigationLink(destination: Text("Test")) {
                            DietPlanCard(model: fasting)
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

struct DietPlanCard: View {
    var model: FastingDietModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(model.image)
                .resizable()
                .cornerRadius(10)
                .frame(width: 270, height: 165, alignment: .center)
            
            Text(model.title)
                .foregroundColor(.green)
                .fontWeight(.heavy)
            
            Text(model.description)
                .bold()
                .foregroundColor(.black)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
        }
    }
}
