//
//  WorkoutViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 3/22/22.
//

import Foundation

final class WorkoutViewModel {
    var workouts = [
        Workout(title: "Lose Weight", subtitle: "Fat Burning", numberOfWorkouts: 10, image: "bodybuilder3"),
        Workout(title: "Gain Muscle", subtitle: "Build Physique", numberOfWorkouts: 6, image: "custom_workout_black"),
        Workout(title: "Maintain Weight", subtitle: "Stay Focused", numberOfWorkouts: 8, image: "custom_workout"),
        Workout(title: "Lose Fat", subtitle: "Fat Burning", numberOfWorkouts: 10, image: "bodybuilder3"),
        Workout(title: "Cardio", subtitle: "Optimal Health", numberOfWorkouts: 12, image: "custom_workout_black"),
    ]
    
    var bodySpecificWorkouts = [
        BodySpecificWorkout(image: "bodybuilder1", title: "ARMS", numberOfWorkouts: 5),
        BodySpecificWorkout(image: "bodybuilder2", title: "CHEST", numberOfWorkouts: 7),
        BodySpecificWorkout(image: "bodybuilder3", title: "SHOULDERS", numberOfWorkouts: 4),
        BodySpecificWorkout(image: "bodybuilder4", title: "LEGS", numberOfWorkouts: 9),
        BodySpecificWorkout(image: "bodybuilder5", title: "CORE", numberOfWorkouts: 15),
        BodySpecificWorkout(image: "bodybuilder6", title: "BACK", numberOfWorkouts: 6),
        BodySpecificWorkout(image: "bodybuilder7", title: "FULL BODY", numberOfWorkouts: 15),
        BodySpecificWorkout(image: "bodybuilder", title: "SHOULDERS & BACK", numberOfWorkouts: 6)
    ]
}
