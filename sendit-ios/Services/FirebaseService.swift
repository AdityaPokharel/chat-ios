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
    static var db = Firestore.firestore()
    static var auth = Auth.auth()

    func isLoggedIn() -> Bool {
        return auth.currentUser != nil
    }
    
    func login(_ email: String, _ password: String, onErr: (Error) -> Void , callback: () -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, err in
            let err = err {
                onErr(err)
                return
            }
            print("User successfully logged in")
            callback()
        }
    }
    
    func signUp (_ email: String, _ password: String, callback: () -> Void) throws {
        Auth.auth().createUser(withEmail: email, password: password) { (result, err) throws in
            if err != nil {
                print("FirebaseService -- error signing up.", err)
            }
            
        }
    }
}

extension AuthService {
    enum FirebaseServiceError: Error {
        case signUpError(String)
        case loginError(String)
    }
}
