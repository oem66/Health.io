//
//  AirqualityEndpoint.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 5/3/22.
//

import Foundation

enum AirQualityEndpoint {
    case locationBased
}

extension AirQualityEndpoint: Endpoint {
    var path: String {
        switch self {
        case .locationBased:
            return "/history/airquality"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .locationBased:
            return .GET
        }
    }
    
    var header: [String:String]? {
        switch self {
        case .locationBased:
            return [
                "x-rapidapi-host" : "air-quality.p.rapidapi.com",
                "x-rapidapi-key" : "05cf9849e3mshb1cb8d9ef31e419p190aa4jsnf27c3adf7663"
            ]
        }
    }
    
    var body: [String:String]? {
        switch self {
        case .locationBased:
            return nil
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .locationBased:
            return [
                URLQueryItem(name: "lon", value: "\(-73.00597)"),
                URLQueryItem(name: "lat", value: "\(40.71427)")
            ]
        }
    }
}
