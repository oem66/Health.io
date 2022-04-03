//
//  WorkoutTypeView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 3/28/22.
//

import SwiftUI

struct WorkoutTypeView: View {
    var viewModel: WorkoutViewModel
    
    var body: some View {
        Divider()
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.workouts, id: \.self) { workout in
                    NavigationLink(destination: Text("Workout")) {
                        WorkoutTypeCardView(workout: workout)
                            .padding(10)
                    }
                }
            }
        }
    }
}

struct WorkoutTypeCardView: View {
    @State var workout: Workout
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(workout.title)
                .foregroundColor(.blue)
                .fontWeight(.heavy)
                .font(.custom("Avenir-Medium", size: 25))
            
            Text(workout.subtitle)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .font(.custom("Avenir-Medium", size: 21))
            
            Text("\(workout.numberOfWorkouts) workouts")
                .foregroundColor(.gray)
                .fontWeight(.bold)
                .font(.custom("Avenir-Medium", size: 17))
            
            Image(workout.image)
                .resizable()
                .cornerRadius(10)
                .frame(width: 270, height: 165, alignment: .center)
        }
    }
}
