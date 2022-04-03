//
//  BodySpecificWorkoutView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 3/28/22.
//

import SwiftUI

struct BodySpecificWorkoutView: View {
    var viewModel: WorkoutViewModel
    
    var body: some View {
        let columns = [GridItem(.flexible(maximum: 250)),
                       GridItem(.flexible(maximum: 250))]
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 5, content: {
                ForEach(viewModel.bodySpecificWorkouts, id: \.self) { workout in
                    NavigationLink(destination: Text("Test")) {
                        BodyPartCardView(image: workout.image, title: workout.title, numberOfWorkouts: workout.numberOfWorkouts)
                            .padding()
                    }
                }
            })
        }
    }
}

struct BodyPartCardView: View {
    @State var image: String
    @State var title: String
    @State var numberOfWorkouts: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 170, height: 220, alignment: .center)
                .cornerRadius(5.0)
                .padding(.bottom, 5)
            
            Text(title)
                .foregroundColor(.blue)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            
            Text("\(numberOfWorkouts) workouts")
                .foregroundColor(.gray)
                .bold()
        }
    }
}

