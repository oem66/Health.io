//
//  WorkoutView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/9/22.
//

import SwiftUI

struct WorkoutView: View {
    private var viewModel = WorkoutViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                CustomWorkoutView()
                    .padding(10)
                
                WorkoutTypeView(viewModel: viewModel)
                    .padding()
                
                Divider()
                    .padding()
                
                HStack {
                    Text("BODY SPECIFIC WORKOUTS")
                        .font(.custom("Avenir-Medium", size: 22))
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)
                        .padding(.top, 10)
                        .padding(.leading, 15)
                    Spacer()
                }
                BodySpecificWorkoutView(viewModel: viewModel)
                    .padding([.leading, .trailing])
                Spacer()
            }
            .navigationTitle("Workout")
            .background(Color(red: 245/255, green: 247/255, blue: 251/255))
        }
    }
}
