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
}
