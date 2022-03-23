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
                
                HStack {
                    Text("BODY SPECIFIC WORKOUTS")
                        .font(.custom("Avenir-Medium", size: 22))
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)
                        .padding(.top, 10)
                        .padding(.leading, 10)
                    Spacer()
                }
                BodySpecificWorkoutView()
                    .padding()
                Spacer()
            }
            .navigationTitle("Workout")
        }
    }
}

// MARK: - Custom Workout
struct CustomWorkoutView: View {
    var body: some View {
        ZStack {
            Image("custom_workout_black")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            VStack(alignment: .center) {
                Text("Custom Workout")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.custom("Avenir-Medium", size: 21))
                    .padding()
                
                Text("Create the most suitable workouts according to your body and physique")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.custom("Avenir-Medium", size: 17))
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                    .padding()
                
                Button {
                    debugPrint("Custom workout button tapped")
                } label: {
                    Text("CREATE NOW"/*LocalizedStringKey("")*/)
                        .font(.custom("Avenir-Medium", size: 20))
                        .fontWeight(.bold)
                        .padding(.vertical, 18)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(.blue)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                        .foregroundColor(.white)
                }
                .padding([.leading, .trailing], 25)
                .padding(.bottom, 8)
            }
            .padding([.leading, .trailing], 35)
        }
        .cornerRadius(10)
        .frame(height: 200, alignment: .center)
        .padding(10)
    }
}

// MARK: - Workout Type
struct WorkoutTypeView: View {
    private var viewModel = WorkoutViewModel()
    
    var body: some View {
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

// MARK: - Body Specific
struct BodySpecificWorkoutView: View {
    var body: some View {
        let columns = [GridItem(.flexible(maximum: 250)),
                       GridItem(.flexible(maximum: 250))]
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 5, content: {
                ForEach((0...12), id: \.self) { _ in
                    NavigationLink(destination: Text("Test")) {
                        BodyPartCardView(image: "bodybuilder", title: "ARM", numberOfWorkouts: 15)
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
            
            Text("\(numberOfWorkouts) workouts")
                .foregroundColor(.gray)
                .bold()
        }
    }
}
