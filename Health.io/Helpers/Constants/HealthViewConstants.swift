//
//  HealthView.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 14. 6. 2022..
//

import Foundation
import SwiftUI

struct HealthViewConstants {
    static let shared = HealthViewConstants()
    
    private init() { }
    
    var start_fasting = LocalizedStringKey(String("start_fasting"))
    var learn_about_health = LocalizedStringKey(String("learn_about_health"))
    var learn_about_health_subtitle = LocalizedStringKey(String("learn_about_health_subtitle"))
    var end_fasting = LocalizedStringKey(String("end_fasting"))
    var weight_yourself = LocalizedStringKey(String("weight_yourself"))
    var weight_yourself_subtitle = LocalizedStringKey(String("weight_yourself_subtitle"))
}
