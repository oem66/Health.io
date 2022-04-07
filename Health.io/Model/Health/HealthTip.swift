//
//  HealthModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 4/7/22.
//

import Foundation
enum HealthTipType { case subtitle, subtitleImage, noSubtitle }

struct HealthTip: Hashable {
    var image: String
    var title: String
    var subtitle: String?
    var subtitleImage: String?
    var type: HealthTipType
}
