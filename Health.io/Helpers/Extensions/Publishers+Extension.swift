//
//  Publishers+Extension.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/25/22.
//

import Combine
import FirebaseAuth

extension Publishers {
    struct AuthenticationPublisher: Publisher {
        typealias Output = User?
        typealias Failure = Never
        
        func receive<S>(subscriber: S) where S : Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
            let authSubscription = AuthenticationSubscription(subscriber: subscriber)
            subscriber.receive(subscription: authSubscription)
        }
    }
    
    class AuthenticationSubscription<S: Subscriber>: Subscription where S.Input == User?, S.Failure == Never {
        
        private var subscriber: S?
        private var handler: AuthStateDidChangeListenerHandle?
        
        init(subscriber: S) {
            self.subscriber = subscriber
            handler = Auth.auth().addStateDidChangeListener { auth, user in
                _ = subscriber.receive(user)
            }
        }
        
        func request(_ demand: Subscribers.Demand) { }
        func cancel() {
            subscriber = nil
            handler = nil
        }
    }
}

