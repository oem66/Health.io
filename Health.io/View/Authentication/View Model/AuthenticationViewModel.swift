//
//  AuthenticationViewModel.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/19/22.
//

import Foundation
import Firebase
import GoogleSignIn

final class AuthenticationViewModel: ObservableObject {
    enum SignInState {
        case signedIn
        case signedOut
    }
    
    @Published var state: SignInState = .signedOut
    
    internal func SignInWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: presentingViewController) { [unowned self] user, error in
            if let error = error {
                debugPrint(error.localizedDescription)
                return
            }
            
            guard let authentication = user?.authentication,
                  let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { result, error in
                if let error = error {
                    debugPrint(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                debugPrint(user.displayName ?? "Success!")
            }
        }
    }
    
    internal func FacebookSignIn() {
        debugPrint("Facebook Sign in from View Model")
    }
    
    internal func AppleSignIn() {
        debugPrint("Apple Sign in from View Model")
    }
}
