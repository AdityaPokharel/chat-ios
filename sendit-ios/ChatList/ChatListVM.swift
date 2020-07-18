//
//  ChatListVM.swift
//  sendit-ios
//
//  Created by Andy on 18/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import SwiftUI

extension ChatListView {
    class ChatListViewModel: ObservableObject {
        @Published var error: String?
        @Published var user: ChatUser?

        init(_ userService: UserService) {
            guard let user = AuthService().currentUser() else {
                self.error = Constants.errorMessageFetch
                return
            }
            let uid = user.uid
            UserService().fetchUserData(uid: uid) { user in
                self.user = user
            }
        }
    }
}
