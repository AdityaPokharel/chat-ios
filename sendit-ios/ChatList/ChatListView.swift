//
//  ChatList.swift
//  sendit-ios
//
//  Created by Andy on 14/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import SwiftUI

struct ChatListView: View {
    @ObservedObject var viewModel = ChatListViewModel()
    @EnvironmentObject var userSession: SessionModel

    init() {
        UITableView.appearance().separatorStyle = .none
    }

    var body: some View {
        VStack {
            if viewModel.user != nil {
                List(viewModel.user!.chats, id: \.time) { item in
                    Text(item.text)
                        .padding(.vertical, 50)
                    }
                .navigationBarTitle(Constants.navigationTitle)
            }
        }
    }
}

struct ChatList_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
