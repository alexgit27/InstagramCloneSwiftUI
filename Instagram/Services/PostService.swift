//
//  PostService.swift
//  Instagram
//
//  Created by Alexandr Ananchenko on 31.10.2023.
//

import Foundation
import FirebaseFirestore

struct PostService {
    
    private static let postsCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postsCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
            for i in 0 ..< posts.count {
                let post = posts[i]
                let ownerUid = post.ownerUid
                //                try await Task.sleep(nanoseconds: 9_000_000_000)
                let postUser = try await UserService.fetchUser(withUid: ownerUid)
                posts[i].user = postUser
            }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postsCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
}
