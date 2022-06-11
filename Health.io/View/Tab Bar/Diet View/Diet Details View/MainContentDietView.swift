//
//  MainContentDietView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 11. 6. 2022..
//

import SwiftUI

struct MainContentDietView: View {
    private var viewModel = MainContentDietViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Ingredients")
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
                    .font(.custom("Avenir-Medium", size: 20))
                
                Spacer()
                
                Text("1 Serves")
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                    .font(.custom("Avenir-Medium", size: 20))
                
                Image(systemName: "cart.badge.plus")
                    .resizable()
                    .frame(width: 25, height: 20, alignment: .center)
                    .foregroundColor(.orange)
            }
            .padding([.leading, .trailing], 15)
            
            List(viewModel.ingredients, id: \.self) { ingredient in
                HStack {
                    Image(ingredient.image)
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .padding(.trailing, 10)
                    
                    VStack {
                        HStack {
                            Text(ingredient.title)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .font(.custom("Avenir-Medium", size: 16))
                            Spacer()
                        }
                        
                        HStack {
                            Text(ingredient.description)
                                .foregroundColor(.gray)
                                .fontWeight(.bold)
                                .font(.custom("Avenir-Medium", size: 14))
                            Spacer()
                        }
                    }
                    Spacer()
                }
            }
            .listStyle(.plain)
        }
    }
}
