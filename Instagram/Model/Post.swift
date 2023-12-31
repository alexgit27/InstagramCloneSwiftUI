//
//  Post.swift
//  Instagram
//
//  Created by Alexandr Ananchenko on 25.10.2023.
//

import Foundation
import FirebaseFirestore

struct Post: Identifiable, Hashable, Codable {
    let id: String
    
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Text caption for now",
              likes: 232,
              imageUrl: "batman_avatar",
              timestamp: Timestamp(),
              user: User.MOCK_USERS[0]),
        
            .init(id: NSUUID().uuidString,
                  ownerUid: NSUUID().uuidString,
                  caption: "Text caption for now",
                  likes: 232,
                  imageUrl: "batman_avatar",
                  timestamp: Timestamp(),
                  user: User.MOCK_USERS[0]),
        
            .init(id: NSUUID().uuidString,
                  ownerUid: NSUUID().uuidString,
                  caption: "Text caption for now",
                  likes: 232,
                  imageUrl: "batman_avatar",
                  timestamp: Timestamp(),
                  user: User.MOCK_USERS[0]),
        
            .init(id: NSUUID().uuidString,
                  ownerUid: NSUUID().uuidString,
                  caption: "Text caption for now",
                  likes: 232,
                  imageUrl: "batman_avatar",
                  timestamp: Timestamp(),
                  user: User.MOCK_USERS[0]),
        
            .init(id: NSUUID().uuidString,
                  ownerUid: NSUUID().uuidString,
                  caption: "Text caption for now",
                  likes: 232,
                  imageUrl: "batman_avatar",
                  timestamp: Timestamp(),
                  user: User.MOCK_USERS[0])
    ]
}
