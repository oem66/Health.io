//
//  HomeViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/8/22.
//

import Foundation

final class HomeViewModel {
    var homeTips = [
        HomeTip(image: "lungs", title: "Air Quality", description: "Air Quality is important for your health"),
        HomeTip(image: "cloud.sun.bolt", title: "Weather, London", description: "Get latest weather forecast for London Area"),
        HomeTip(image: "pills", title: "Gym", description: "Get ripped as fuck as fast as possible"),
        HomeTip(image: "takeoutbag.and.cup.and.straw", title: "Diet", description: "Die plays key role in your general health and fitness level"),
    ]
    
    var healthInsigts = [
        HealthInsight(image: "heart", title: "Heart Rate", value: 68),
        HealthInsight(image: "heart", title: "Resting Heart Rate", value: 49),
        HealthInsight(image: "heart", title: "Walking Heart Rate Average", value: 105),
        HealthInsight(image: "heart", title: "Exercise Minutes", value: 80),
        HealthInsight(image: "heart", title: "Walking Speed", value: 6),
        
        HealthInsight(image: "fire", title: "Active Energy", value: 256),
        HealthInsight(image: "fire", title: "Steps", value: 12670),
        HealthInsight(image: "fire", title: "Walking Running Distance", value: 6580),
        HealthInsight(image: "fire", title: "Flights Climbed", value: 10),
        
        HealthInsight(image: "metabolism", title: "Height", value: 181),
        HealthInsight(image: "metabolism", title: "Weight", value: 91),
        HealthInsight(image: "metabolism", title: "Body Mass Index", value: 75),
        
        HealthInsight(image: "lungs", title: "Blood Oxygen", value: 98),
        HealthInsight(image: "lungs", title: "Respiratory Rate", value: 97),
        
        HealthInsight(image: "sleep", title: "Sleep", value: 7),
        
        HealthInsight(image: "uv-index", title: "UV Index", value: 2),
        HealthInsight(image: "glucose-meter", title: "Blood Glucose", value: 5),
        HealthInsight(image: "brain", title: "Mindful Minutes", value: 15)
    ]
}
