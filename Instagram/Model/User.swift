//
//  User.swift
//  Instagram
//
//  Created by Alexandr Ananchenko on 25.10.2023.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    
    var username: String
    var profileImageURL: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: UUID().uuidString, username: "batman", profileImageURL: "batman_avatar", fullname: "Bruce Wayne", bio: "Gotham dark knight", email: "batman@gmail.com"),
        .init(id: UUID().uuidString, username: "batman", profileImageURL: "batman_avatar", fullname: "Bruce Wayne", bio: "Gotham dark knight", email: "batman@gmail.com"),
        .init(id: UUID().uuidString, username: "batman", profileImageURL: "batman_avatar", fullname: "Bruce Wayne", bio: "Gotham dark knight", email: "batman@gmail.com"),
        .init(id: UUID().uuidString, username: "batman", profileImageURL: "batman_avatar", fullname: "Bruce Wayne", bio: "Gotham dark knight", email: "batman@gmail.com")
    ]
}
