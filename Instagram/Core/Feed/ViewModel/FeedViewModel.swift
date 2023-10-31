//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Alexandr Ananchenko on 31.10.2023.
//

import Foundation
import FirebaseFirestore

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        
            for i in 0 ..< posts.count {
                let post = posts[i]
                let ownerUid = post.ownerUid
//                try await Task.sleep(nanoseconds: 9_000_000_000)
                let postUser = try await UserService.fetchUser(withUid: ownerUid)
                self.posts[i].user = postUser
            }
        
    }
}
