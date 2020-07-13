//
//  LoginVC.swift
//  sendit-ios
//
//  Created by Andy on 13/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import UIKit
import SwiftUI

class LoginVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialView = UIHostingController(
            rootView: LoginView(onSignIn: .constant({ [weak self] (username: String, password: String) in
                self?.login(username, password)
            }))
        )

        addChild(initialView)
        initialView.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(initialView.view)
        
        NSLayoutConstraint.activate([
            initialView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            initialView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            initialView.view.topAnchor.constraint(equalTo: view.topAnchor),
            initialView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func login(_ username: String, _ password: String) {
        print("username: \(username), password: \(password)")
    }
}



