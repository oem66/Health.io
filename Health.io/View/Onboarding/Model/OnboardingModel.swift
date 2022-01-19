//
//  OnboardingModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/14/22.
//

import Foundation

struct OnboardingModel: Identifiable, Hashable {
    var id = UUID()
    var image: String
    var title: String
    var description: String
}
