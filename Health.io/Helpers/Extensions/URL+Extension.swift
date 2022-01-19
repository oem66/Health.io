//
//  URL+Extension.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/13/22.
//

import Foundation

extension URLComponents {
    mutating func setQueryItems(with parameters: [String:String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
