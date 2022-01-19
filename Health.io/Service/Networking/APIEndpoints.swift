//
//  APIEndpoints.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/6/22.
//

import Foundation

final class APIEndpoints {
    static let shared = APIEndpoints()
    private init() { }
    
    // MARK: - Weather API
    
    // MARK: - eAmbulance API
    
    // MARK: - Unaplash API
    
    // MARK: - COVID 19
    //  https://covid-193.p.rapidapi.com/history?country=usa&day=2020-06-02
    internal func provideParameters(country: String, day: String) -> [String:String] {
        return [
            "country" : "\(country)",
            "day" : "\(day)"
        ]
    }
    
    let covidHeaders = [
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "82372cb655mshab6177a9894b51ap1ded3ejsn70d4797d5e5f"
    ]
    
    internal func covid19DataURL() -> URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "covid-193.p.rapidapi.com"
        components.path = "/history"
        components.setQueryItems(with: provideParameters(country: "usa", day: "2020-06-02"))
        return components
    }
}
