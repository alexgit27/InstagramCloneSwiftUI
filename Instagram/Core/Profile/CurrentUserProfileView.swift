//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by Alexandr Ananchenko on 25.10.2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    
    private var posts: [Post] {
        return Post.MOCK_POSTS.filter{$0.user?.username == user.username}
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                ProfileHeaderView(user: user)
                
                PostGridView(posts: posts)
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            })
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
}
