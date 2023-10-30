//
//  ProfileView.swift
//  Instagram
//
//  Created by Alexandr Ananchenko on 20.10.2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User
        
    private var posts: [Post] {
        return Post.MOCK_POSTS.filter{$0.user?.username == user.username}
    }
    
    var body: some View {
        ScrollView {
            
            ProfileHeaderView(user: user)
            
            PostGridView(posts: posts)
            
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
