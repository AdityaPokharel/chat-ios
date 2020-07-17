//
//  LoginVC.swift
//  sendit-ios
//
//  Created by Andy on 13/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import UIKit
import SwiftUI

extension LoginView {
    class LoginViewModel: ObservableObject {
        private var firebase = AuthService()
        @Published var email: String = ""
        @Published var password: String = ""
        @Published var errorMessage: String = ""
        @Published var isLoading: Bool = false
        
        func onSignIn(callback: @escaping (_ uid: String) -> Void) {
            firebase.signIn(email, password, onError: { err in
                self.errorMessage = "Error signing in. Check your details dumbass."
                self.isLoading = false
            }) {
                guard let uid = AuthService().currentUser()?.uid else {
                    self.errorMessage = "Error fetching userID. Try again later dumbass."
                    return
                }
                callback(uid)
            }
        }
    }
}


