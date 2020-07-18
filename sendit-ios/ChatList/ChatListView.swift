//
//  ChatList.swift
//  sendit-ios
//
//  Created by Andy on 14/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import SwiftUI

struct ChatListView: View {
    @ObservedObject var viewModel = ChatListViewModel(UserService())
    @EnvironmentObject var userSession: SessionModel

    init() {
        UITableView.appearance().separatorStyle = .none
    }

    var body: some View {
        VStack {
            if viewModel.user != nil {
                List(viewModel.user!.chats, id: \.self) { item in
                    Text(item)
                        .padding(.vertical, 50)
                    }
                .navigationBarTitle(Constants.navigationTitle)
            }
        }
    }
}

// VM
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

// Constants
extension ChatListView {
    enum Constants {
        static let errorMessageFetch = "CHAT Error decoding current user."
        static let navigationTitle = "Your Chats"
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
