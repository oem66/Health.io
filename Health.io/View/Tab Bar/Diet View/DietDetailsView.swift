//
//  DietDetailsView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 4/7/22.
//

import SwiftUI

struct DietDetailsView: View {
    var body: some View {
            VStack {
                TopDietView()
                    .padding(.bottom, 5)
                
                MainContentDietView()
                    .padding()
            }
    }
}

struct TopDietView: View {
    var body: some View {
        ZStack {
            Image("food1")
                .resizable()
                .frame(width: .infinity, height: .infinity, alignment: .center)
                .edgesIgnoringSafeArea(.top)
                .brightness(-0.30)
            
            VStack(alignment: .leading) {
                Spacer()
                
                HStack {
                    Text("4.7")
                        .font(.custom("Avenir-Medium", size: 18))
                        .foregroundColor(.orange)
                        .fontWeight(.bold)
                    
                    Text("(258)")
                        .font(.custom("Avenir-Medium", size: 18))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.leading, 15)
                
                VStack(alignment: .leading) {
                    Text("Spaghetti and Meatballs")
                        .font(.custom("Avenir-Medium", size: 25))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    Text("ONCE UPON A CHEF")
                        .font(.custom("Avenir-Medium", size: 22))
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                }
                .padding(.leading, 15)
                .padding(.bottom, 5)
                
                HStack {
                    MacrosCardView(amount: 760, macroName: .Calories("Calories"), unit: "cal", color: .purple)
                    MacrosCardView(amount: 75, macroName: .Protein("Protein"), unit: "g", color: .blue)
                    MacrosCardView(amount: 350, macroName: .Carbs("Carbs"), unit: "g",color: .orange)
                    MacrosCardView(amount: 65, macroName: .Fat("Fat"), unit: "g",color: .red)
                    Spacer()
                }
                .padding([.leading, .trailing, .bottom], 15)
            }
        }
        .frame(width: .infinity, height: 180, alignment: .center)
    }
}

enum AllMacros {
    case Calories(String)
    case Protein(String)
    case Carbs(String)
    case Fat(String)
}

struct MacrosCardView: View {
    var amount: Int
    var macroName: AllMacros
    var unit: String
    var color: Color
    
    var body: some View {
        VStack {
            HStack {
                switch macroName {
                case .Calories(let string):
                    MacroView(macroName: string)
                case .Protein(let string):
                    MacroView(macroName: string)
                case .Carbs(let string):
                    MacroView(macroName: string)
                case .Fat(let string):
                    MacroView(macroName: string)
                }
                Spacer()
            }
            
            HStack {
                Text("\(amount)")
                    .font(.custom("Avenir-Medium", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(color)
                
                Text(unit)
                    .font(.custom("Avenir-Medium", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(color)
                    .padding(.trailing, 3)
                
                Spacer()
            }
        }
    }
}

struct MacroView: View {
    var macroName: String
    
    var body: some View {
        Text(macroName)
            .font(.custom("Avenir-Medium", size: 18))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

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

struct IngredientCardView: View {
    var body: some View {
        ZStack {
            Color(red: 246/255, green: 248/255, blue: 252/255)
            HStack {
                ZStack {
                    Color(.white)
                    VStack {
                        Image(systemName: "cart.fill")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .center)
                    }
                    .padding(5)
                }
                .clipped()
                .cornerRadius(10)
                .padding(3)
                
                VStack {
                    HStack {
                        Text("Coconut Oil")
                            .foregroundColor(.black)
                            .font(.custom("Avenir-Medium", size: 18))
                            .fontWeight(.heavy)
                        Spacer()
                    }
                    
                    HStack {
                        Text("Cheap and easy to buy")
                            .foregroundColor(.gray)
                            .font(.custom("Avenir-Medium", size: 15))
                            .fontWeight(.bold)
                    }
                }
                
                Spacer()
                
                VStack {
                    Text("1 spoon")
                        .font(.custom("Avenir-Medium", size: 15))
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                }
                .padding(3)
            }
        }
        .clipped()
        .cornerRadius(10)
    }
}
