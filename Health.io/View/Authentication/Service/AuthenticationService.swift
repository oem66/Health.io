//
//  AuthenticationService.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/25/22.
//

import Combine
import FirebaseAuth

enum AuthenticationError: LocalizedError {
    case auth(description: String)
    case `default`(description: String? = nil)
    
    var errorDescription: String? {
        switch self {
        case let .auth(description):
            return description
        case let .default(description):
            return description ?? "Something went wrong"
        }
    }
}

protocol AuthenticationServiceProtocol {
    func currentUser() -> AnyPublisher<User?, Never>
    func signInAnnonymously() -> AnyPublisher<User, AuthenticationError>
    func observeAuthChange() -> AnyPublisher<User?, Never>
}

final class AuthenticationService: AuthenticationServiceProtocol {
    func currentUser() -> AnyPublisher<User?, Never> {
        Just(Auth.auth().currentUser).eraseToAnyPublisher()
    }
    
    func signInAnnonymously() -> AnyPublisher<User, AuthenticationError> {
        return Future<User, AuthenticationError> { promise in
            Auth.auth().signInAnonymously { result, error in
                if let error = error {
                    return promise(.failure(.auth(description: error.localizedDescription)))
                } else if let user = result?.user {
                    return promise(.success(user))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func observeAuthChange() -> AnyPublisher<User?, Never> {
        Publishers.AuthenticationPublishers().eraseToAnyPublisher()
    }
}
