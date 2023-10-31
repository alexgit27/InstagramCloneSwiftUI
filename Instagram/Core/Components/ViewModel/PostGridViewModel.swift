//
//  PostGridViewModel.swift
//  Instagram
//
//  Created by Alexandr Ananchenko on 31.10.2023.
//

import Foundation

class PostGridViewModel: ObservableObject {
    private let user: User
    @Published var posts = [Post]()
    
    init(user: User) {
        self.user = user
        
        Task { try await fetchUserPosts() }
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        self.posts = try await PostService.fetchUserPosts(uid: user.id)
        
        for i in 0 ..< posts.count {
            self.posts[i].user = self.user
        }
    }
}
