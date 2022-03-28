//
//  WorkoutView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/9/22.
//

import SwiftUI

struct WorkoutView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                CustomWorkoutView()
                    .padding(10)
                
                WorkoutTypeView()
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
                BodySpecificWorkoutView()
                    .padding([.leading, .trailing])
                Spacer()
            }
            .navigationTitle("Workout")
        }
    }
}
