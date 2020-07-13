//
//  LoginFlow.swift
//  sendit-ios
//
//  Created by Andy on 13/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import SwiftUI

struct LoginFlow: UIViewControllerRepresentable {
    typealias UIViewControllerType = UINavigationController

    func makeUIViewController(context: UIViewControllerRepresentableContext<LoginFlow>) -> UINavigationController {
        return UINavigationController(rootViewController: LoginVC())
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: UIViewControllerRepresentableContext<LoginFlow>) {
    }
}
