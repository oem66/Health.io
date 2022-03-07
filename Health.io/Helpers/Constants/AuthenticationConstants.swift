//
//  AuthenticationConstants.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/16/22.
//

import Foundation

struct AuthenticationConstants {
    static let shared = AuthenticationConstants()
    private init() { }
    
    var authPhoto = "auth"
    var title = "Health.io"
    var description = "Log in into your Health.io account and start taking care of your health with assistance provided by the best healthcare workers in your area."
    var user_auth_state = "user_auth_state"
}
