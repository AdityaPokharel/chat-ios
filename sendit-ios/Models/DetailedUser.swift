//
//  User.swift
//  sendit-ios
//
//  Created by Andy on 16/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

struct DetailedUser: Equatable {
    static func == (lhs: DetailedUser, rhs: DetailedUser) -> Bool {
        return lhs.uid == rhs.uid
    }
    
    var uid: String
    var firstName: String
    var lastName: String
    var image: String
    var chats: [ChatBubble]
}
