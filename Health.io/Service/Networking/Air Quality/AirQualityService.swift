//
//  AirQualityService.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/1/22.
//

import Combine

protocol AirQualityProtocol {
    func getCurrentAirQuality() -> AnyPublisher<AirQuality, Error>
    func getAirQualityForecast() -> AnyPublisher<AirQuality, Error>
}

final class AirQualityService: AirQualityProtocol {
    func getCurrentAirQuality() {
        
    }
    
    func getAirQualityForecast() {
        
    }
}
