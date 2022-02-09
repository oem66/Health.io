//
//  AuthenticationViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/19/22.
//

import Combine
import Firebase
import GoogleSignIn
import SwiftUI

typealias UserId = String

class AuthenticationViewModel: ObservableObject {
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    @Published var state: SignInState = .signedOut
    @Published var signinAnonymously = false
    
    private let authenticationService: AuthenticationServiceProtocol
    private var cancellables: AnyCancellable?
    
    init(authenticationService: AuthenticationServiceProtocol = AuthenticationService()) {
        self.authenticationService = authenticationService
    }
    
    internal func SignInWithGoogle(authState: @escaping ()->()) {
        cancellables = authenticationService.signInWithGoogle().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                authState()
            case.failure(let error):
                debugPrint(error.localizedDescription)
            }
        }, receiveValue: { user in
            debugPrint("User Signed in with Google: \(user.uid)")
        })
    }
    
    internal func signInAnonymously() {
        cancellables = authenticationService.signInAnonymously().sink(receiveCompletion: { completion in

        }, receiveValue: { user in
            debugPrint("User signInAnnonymously: \(user.uid)")
        })
    }
    
    internal func FacebookSignIn() {
        debugPrint("Facebook Sign in from View Model")
    }
    
    internal func AppleSignIn() {
        debugPrint("Apple Sign in from View Model")
    }
    
    private func currentUserId() -> AnyPublisher<UserId, Error> {
        return authenticationService.currentUser().flatMap { user -> AnyPublisher<UserId, Error> in
            if let userId = user?.uid {
                return Just(userId)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            } else {
                return Just("")
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
}
