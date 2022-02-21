//
//  Requestable.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 2/18/22.
//

import Foundation
import Combine

public protocol Requestable {
    var requestTimeOut: Float { get }
    
    func request<T: Codable>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
}
