//
//  FirebaseWrapper.swift
//  sendit-ios
//
//  Created by Andy on 13/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    func isSignedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    func currentUser() -> FirebaseAuth.User? {
        return Auth.auth().currentUser!
    }
    
    func signOut() {
        do {
            print("User signed out.")
            try Auth.auth().signOut()
        } catch {
            print("Error signing out.")
        }
    }
    
    func signIn(_ email: String, _ password: String, onError: @escaping (Error) -> Void, callback: @escaping () -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, err in
            if let err = err {
                print("Error signing up - \(err)")
                onError(err)
                return
            }
            print("User logged in successfully")
            callback()
        }
    }

//    func signUp (_ email: String, _ password: String, callback: () -> Void) throws {
//        Auth.auth().createUser(withEmail: email, password: password) { (result, err) throws in
//            if err != nil {
//                print("FirebaseService -- error signing up.", err)
//            }
//        }
//    }
}

extension AuthService {
    enum FirebaseServiceError: Error {
        case signUpError(String)
        case loginError(String)
    }
}
