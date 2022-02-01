//
//  AirQuality.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/1/22.
//

import Foundation

struct AirQuality: Decodable {
    var data: [AirQualityData]
    var city_name: String
    var lon: Decimal
    var timezone: String
    var lat: Decimal
    var country_code: String
    var state_code: String
}

struct AirQualityData: Decodable {
    var mold_level: Int
    var aqi: Int
    var pm10: Decimal
    var co: Decimal
    var o3: Int
    var predominant_pollen_type: String
    var so2: Int
    var pollen_level_tree: Int
    var pollen_level_weed: Int
    var no2: Decimal
    var pm25: Decimal
    var pollen_level_grass: Int
}
