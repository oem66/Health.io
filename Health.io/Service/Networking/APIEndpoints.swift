//
//  APIEndpoints.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/6/22.
//

import Foundation

enum HTTPMethod: String { case GET, POST, PUT, DELETE }

final class APIEndpoints {
    static let shared = APIEndpoints()
    private init() { }
    
    // MARK: - Weather API
    
    // MARK: - eAmbulance API
    
    // MARK: - Unaplash API
    
    // MARK: - Air Quality API
    static var x_rapidapi_host: String { return "x-rapidapi-host" }
    static var x_rapidapi_key: String { return "x-rapidapi-key" }
    static var air_quality_host: String { return "air-quality.p.rapidapi.com" }
    static var air_quality_key: String { return "05cf9849e3mshb1cb8d9ef31e419p190aa4jsnf27c3adf7663" }
    static var https_scheme: String { return "https" }
    
    internal func aqiParams(lon: Double, lat: Double) -> [String:String] {
        return [
            "lon": "\(lon)",
            "lat": "\(lat)"
        ]
    }
    
    let aqiHeaders = [
        x_rapidapi_host: air_quality_host,
        x_rapidapi_key: air_quality_key
    ]
    
    internal func airQualityURL() -> URLComponents {
        var components = URLComponents()
        components.scheme = APIEndpoints.https_scheme
        components.host = "air-quality.p.rapidapi.com"
        components.path = "/current/airquality"
        components.setQueryItems(with: aqiParams(lon: -73.00597, lat: 40.71427))
        return components
    }
    
    // MARK: - COVID 19
    //  https://covid-193.p.rapidapi.com/history?country=usa&day=2020-06-02
    internal func provideParameters(country: String, day: String) -> [String:String] {
        return [
            "country" : "\(country)",
            "day" : "\(day)"
        ]
    }
    
    let covidHeaders = [
        x_rapidapi_host: "covid-193.p.rapidapi.com",
        x_rapidapi_key: "82372cb655mshab6177a9894b51ap1ded3ejsn70d4797d5e5f"
    ]
    
    internal func covid19DataURL() -> URLComponents {
        var components = URLComponents()
        components.scheme = APIEndpoints.https_scheme
        components.host = "covid-193.p.rapidapi.com"
        components.path = "/history"
        components.setQueryItems(with: provideParameters(country: "usa", day: "2020-06-02"))
        return components
    }
}
