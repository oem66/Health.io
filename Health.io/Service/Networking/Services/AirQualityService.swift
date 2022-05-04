//
//  AirQualityService.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/1/22.
//

import Foundation
import Combine

protocol AirQualityProtocol {
//    func getCurrentAirQuality() -> AnyPublisher<AirQuality, Error>
//    func getAirQualityForecast() -> AnyPublisher<AirQuality, Error>
    func getAirQualityData() async -> Result<AirQuality, RequestError>
}

final class AirQualityService: HTTPClient, AirQualityProtocol {
//    func getCurrentAirQuality() -> AnyPublisher<AirQuality, Error> {
//        var request = URLRequest(url: APIEndpoints.shared.airQualityURL().url!)
//        request.httpMethod = HTTPMethod.GET.rawValue
//        request.allHTTPHeaderFields = APIEndpoints.shared.aqiHeaders
//
//        return URLSession.shared.dataTaskPublisher(for: request)
//            .map { $0.data }
//            .decode(type: AirQuality.self, decoder: JSONDecoder())
//            .receive(on: RunLoop.main)
//            .eraseToAnyPublisher()
//    }
    
//    func getAirQualityForecast() -> AnyPublisher<AirQuality, Error> {
//
//    }
    func getAirQualityData() async -> Result<AirQuality, RequestError> {
        return await sendRequest(endpoint: AirQualityEndpoint.locationBased , responseModel: AirQuality.self)
    }
}
