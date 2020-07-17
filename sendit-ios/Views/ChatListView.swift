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
                .navigationBarTitle("Your Chats")
            }
        }
    }
}

extension ChatListView {
    class ChatListViewModel: ObservableObject {
        @Published var user: ChatUser?
        @Published var chatList: [ChatRow] = []
        @Published var error: String?

        init(_ userService: UserService) {
            guard let user = AuthService().currentUser() else {
                self.error = "CHAT Error fetching current user."
                return
            }
            let uid = user.uid
            UserService().fetchUserData(uid: uid) { user in
                self.user = user
            }
        }
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
