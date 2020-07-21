//
//  UserService.swift
//  sendit-ios
//
//  Created by Andy on 17/7/20.
//  Copyright © 2020 Aditya Pokharel. All rights reserved.
//

import FirebaseFirestore

class UserService {

    /// Fetches the detailed user data for the user logged in.
    /// TODO: Refactor with promises once logic is satisfied.
    /// - Parameters:
    ///   - uid: uid of the user as received from firebase.
    ///   - callback: callback that gets the detailed user as a parameter
    public func fetchUserData(uid: String, callback: @escaping (DetailedUser) -> Void) {
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
                    self.fetchAllUserChats(chatIDs: chats) { chatBubbles in
                        callback(DetailedUser(
                            uid: uid,
                            firstName: firstName,
                            lastName: lastName,
                            image: image,
                            chats: chatBubbles))
                    }
                }
            }
        }
    }


    /// gets foreign user associated with a specific uid.
    /// - Parameters:
    ///   - uid: uid of the foreign user
    ///   - callback: passes the foreign user as callback arg
    private func getForeignUser(uid: String, callback: @escaping (SimpleUser) -> Void) {
        let db = Firestore.firestore()
        
        let docRef = db.collection("users").document(uid)
        docRef.getDocument { document, error in
            if let error = error {
                print("ERROR -- Error geting document", error)
                return
            }
            if let document = document, document.exists {
                guard let uid = document.data()!["uid"] as? String else { return }
                guard let firstName = document.data()!["firstName"] as? String else { return }
                guard let lastName = document.data()!["lastName"] as? String else { return }
                guard let image = document.data()!["image"] as? String else { return }

                callback(SimpleUser(
                    uid: uid,
                    firstName: firstName,
                    lastName: lastName,
                    image: image))
            }
        }
    }

    private func fetchAllUserChats(chatIDs: [String], callback: @escaping ([ChatBubble]) -> Void) {
        let db = Firestore.firestore()
        var chats = [ChatBubble]()

        chatIDs.forEach { chatId in
            let docRef = db.collection("chat").document(chatId)

            docRef.getDocument { (document, error) in
                if let error = error {
                    print("ERROR -- Error getting document", error)
                    return
                }

                if let document = document, document.exists {
                    guard let uids = document.data()!["users"] as? [String] else { return }
                    guard let chatsObj  = document.data()!["chat"] as? [[String: Any]] else { return }
                    var simpleUsers = [SimpleUser]()

                    uids.forEach { uid in
                        self.getForeignUser(uid: uid) { user in
                            simpleUsers.append(user)
                        }
                    }

                    chatsObj.forEach { anyObj in
                        guard let sender = anyObj["sender"] as? String else { return }
                        guard let text = anyObj["text"] as? String else { return }
                        guard let timestamp: Timestamp = anyObj["time"] as? Timestamp else { return }

                        chats.append(ChatBubble(sender: sender, text: text, time: timestamp.dateValue()))
                    }

                } else {
                    print("ERRROR -- Document does not exist")
                }
            }
        }
    }
}

