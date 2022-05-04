//
//  Endpoint.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 5/2/22.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String:String]? { get }
    var body: [String:String]? { get }
    var parameters: [String:String]? { get }
}

extension Endpoint {
    var baseURL: String {
        return "https://air-quality.p.rapidapi.com"
    }
}
