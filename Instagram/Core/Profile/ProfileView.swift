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
        return Post.MOCK_POSTS
    }
    

    
    var body: some View {
             ScrollView {
                
                VStack(spacing: 10) {
                    HStack {
                        Image(user.profileImageURL ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        Spacer()
                        
                        HStack(spacing: 8) {
                            UserStackView(value: 3, title: "Posts")
                            UserStackView(value: 1, title: "Followers")
                            UserStackView(value: 2, title: "Following")
                        }
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        if let fullname = user.fullname {
                            Text(fullname)
                                .font(.footnote)
                                .fontWeight(.semibold)
                        }
                        
                        if let bio = user.bio {
                            Text(bio)
                                .font(.footnote)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    Button {
                         
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .foregroundColor(.black)
                            .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.gray, lineWidth: 1.0)
                            )
                    }
                    
                    Divider()
                }
                
          PostGridView(posts: posts)
            }
             .navigationTitle("Profile")
             .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
