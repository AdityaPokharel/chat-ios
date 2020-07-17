//
//  ContentView.swift
//  sendit-ios
//
//  Created by Andy on 13/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userSession: SessionModel

    var body: some View {
        NavigationView {
            if userSession.isLoggedIn {
                ChatListView()
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
