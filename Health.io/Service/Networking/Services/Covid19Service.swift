//
//  Covid19Service.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/11/22.
//

import Foundation
import Combine

protocol Covid19Protocol {
    func fetchCovid19Data() -> AnyPublisher<Covid19Stats, Error>
}

final class Covid19Service: Covid19Protocol {
    
    internal func fetchCovid19Data() -> AnyPublisher<Covid19Stats, Error> {
        var request = URLRequest(url: APIEndpoints.shared.covid19DataURL().url!)
        request.httpMethod = HTTPMethod.GET.rawValue
        request.allHTTPHeaderFields = APIEndpoints.shared.covidHeaders
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: Covid19Stats.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}