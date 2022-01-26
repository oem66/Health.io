//
//  AuthenticationService.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/25/22.
//

import Combine
import Firebase
import FirebaseAuth
import GoogleSignIn

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
    func signInWithGoogle() -> AnyPublisher<User, AuthenticationError>
    func signInAnnonymously() -> AnyPublisher<User, AuthenticationError>
    func observeAuthChange() -> AnyPublisher<User?, Never>
}

class AuthenticationService: AuthenticationServiceProtocol {
    func currentUser() -> AnyPublisher<User?, Never> {
        Just(Auth.auth().currentUser).eraseToAnyPublisher()
    }
    
    func signInWithGoogle() -> AnyPublisher<User, AuthenticationError> {
        return Future<User, AuthenticationError> { promise in
            if let clientID = FirebaseApp.app()?.options.clientID {
                let config = GIDConfiguration(clientID: clientID)
                if let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController {
                    GIDSignIn.sharedInstance.signIn(with: config, presenting: presentingViewController) { user, error in
                        if let error = error { return promise(.failure(.auth(description: error.localizedDescription))) }
                        
                        guard let authentication = user?.authentication,
                              let idToken = authentication.idToken
                        else { return promise(.failure(.default())) }
                        
                        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
                        Auth.auth().signIn(with: credential) { result, error in
                            if let error = error { return promise(.failure(.auth(description: error.localizedDescription))) }
                            
                            guard let user = result?.user else { return promise(.failure(.default())) }
                            return promise(.success(user))
                        }
                    }
                }
            }
        }
        .eraseToAnyPublisher()
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
        Publishers.AuthenticationPublisher().eraseToAnyPublisher()
    }
}
