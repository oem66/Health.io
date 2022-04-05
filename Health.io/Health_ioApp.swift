//
//  Health_ioApp.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 12/31/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct Health_ioApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    let persistenceController = PersistenceController.shared
    
    init() { }
    
    var body: some Scene {
        WindowGroup {
            //            ContentView()
            //                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
            if let authState = KeychainWrapper.standard.bool(forKey: AuthenticationConstants.shared.user_auth_state) {
                if authState { HomeView() } else { OnboardingView() }
            } else {
                OnboardingView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
