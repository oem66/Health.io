//
//  View+Extension.swift
//  Health.io
//
//  Created by Omer Rahmanovic on 1/19/22.
//

import Foundation
import SwiftUI

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    // Retreive Root ViewController
//    func getRootViewController() -> UIViewController {
//        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
//            return .init()
//        }
//        guard root = screen.windows.first?.rootViewController else {
//            return .init()
//        }
//        return root
//    }
}
