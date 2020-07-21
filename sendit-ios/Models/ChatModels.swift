//
//  ChatModels.swift
//  sendit-ios
//
//  Created by Andy on 16/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//
import Foundation

struct ChatBubble {
    var sender: String
    var text: String
    var time: Date
}

struct ChatInstance {
    var id: String
    var seen: Bool
    var sender: DetailedUser
    var texts: [ChatBubble]
}
