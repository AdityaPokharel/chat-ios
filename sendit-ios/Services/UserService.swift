//
//  UserService.swift
//  sendit-ios
//
//  Created by Andy on 17/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import FirebaseFirestore

struct ChatUser {
    var uid: String
    var firstName: String
    var lastName: String
    var image: String
    var chats: [String]
}

class UserService {
    func fetchUserData(uid: String, callback: @escaping (ChatUser) -> Void) {
        let db = Firestore.firestore()
        let users = db.collection("users")
        users.whereField("uid", isEqualTo: uid).getDocuments() { snap, err in
            if let err = err {
                print("Error getting documents \(err)")
                return
            }
            for i in snap!.documentChanges {
                if i.type == .added {
                    guard let firstName = i.document.get("firstName") as? String else { return }
                    guard let lastName = i.document.get("lastName") as? String else { return }
                    guard let image = i.document.get("image") as? String else { return }
                    guard let uid = i.document.get("uid") as? String else { return }
                    guard let chats = i.document.get("chats") as? [String] else { return }
                    callback(ChatUser(
                        uid: uid,
                        firstName: firstName,
                        lastName: lastName,
                        image: image,
                        chats: chats))
                }
            }
        }
    }
}
