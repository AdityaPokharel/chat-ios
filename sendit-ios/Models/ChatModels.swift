//
//  ChatModels.swift
//  sendit-ios
//
//  Created by Andy on 16/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//
import Foundation

struct ChatBubble {
    var timestamp: Date
    var text: String
}

struct ChatRow {
    var id: String
    var seen: Bool
    var sender: ChatUser
    var texts: [ChatBubble]
}
