//
//  AuthenticationViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/19/22.
//

import Combine
import Firebase
import GoogleSignIn

typealias UserId = String

class AuthenticationViewModel: ObservableObject {
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    @Published var state: SignInState = .signedOut
    @Published var googleAuthSuccessful = false
    private let authenticationService: AuthenticationServiceProtocol
    private var cancellables: AnyCancellable?
    
    init(authenticationService: AuthenticationServiceProtocol = AuthenticationService()) {
        self.authenticationService = authenticationService
    }
    
    internal func SignInWithGoogle() {
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//        let config = GIDConfiguration(clientID: clientID)
//        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
//
//        GIDSignIn.sharedInstance.signIn(with: config, presenting: presentingViewController) { [unowned self] user, error in
//            if let error = error { debugPrint(error.localizedDescription); return }
//
//            guard let authentication = user?.authentication,
//                  let idToken = authentication.idToken
//            else { return }
//
//            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
//            Auth.auth().signIn(with: credential) { result, error in
//                if let error = error { debugPrint(error.localizedDescription); return }
//                guard let user = result?.user else { return }
//                debugPrint(user.displayName ?? "Success!")
//            }
//        }
        cancellables = authenticationService.signInWithGoogle().sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                self.googleAuthSuccessful = true
            case.failure(let error):
                debugPrint(error.localizedDescription)
            }
        }, receiveValue: { user in
            debugPrint("User signInAnnonymously: \(user.uid)")
        })
    }
    
    internal func signInAnnonymously() {
        cancellables = authenticationService.signInAnnonymously().sink(receiveCompletion: { completion in

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
//                return self.authenticationService
//                    .signInAnnonymously()
//                    .map { $0.uid }
//                    .eraseToAnyPublisher()
                return Just("")
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            }
        }.eraseToAnyPublisher()
    }
}
