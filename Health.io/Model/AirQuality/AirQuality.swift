//
//  AirQuality.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/1/22.
//

import Foundation

struct AirQuality: Decodable {
    var data: [AirQualityData]?
    var city_name: String?
    var lon: Double?
    var timezone: String?
    var lat: Double?
    var country_code: String?
    var state_code: String?
}

struct AirQualityData: Decodable {
    var mold_level: Double?
    var aqi: Double?
    var pm10: Double?
    var co: Double?
    var o3: Double?
    var predominant_pollen_type: String?
    var so2: Double?
    var pollen_level_tree: Double?
    var pollen_level_weed: Double?
    var no2: Double?
    var pm25: Double?
    var pollen_level_grass: Double?
}
