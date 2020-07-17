//
//  AuthModel.swift
//  sendit-ios
//
//  Created by Andy on 14/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import Foundation

class SessionModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var uid: String?
}
