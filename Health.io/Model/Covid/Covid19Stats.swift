//
//  Covid19Stats.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/11/22.
//

import Foundation

struct Covid19Stats: Codable {
    var get: String?
    var parameters: [Parameter]?
    var results: Int?
    var response: [Response]?
}

struct Parameter: Codable {
    var country: String?
    var day: String?
}

struct Response: Codable {
    var continent: String?
    var country: String?
    var population: Int?
    var cases: Case?
    var deaths: Death?
    var tests: Test?
    var day: String?
}

struct Case: Codable {
    var new: String?
    var active: Int?
    var critical: Int?
    var recovered: Int?
    var total: Int?
}

struct Death: Codable {
    var new: String?
    var total: Int?
}

struct Test: Codable {
    var total: Int?
}
