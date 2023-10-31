//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by Alexandr Ananchenko on 25.10.2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User

    var body: some View {
        NavigationStack {
            ScrollView {
                
                ProfileHeaderView(user: user)
                
                PostGridView(user: user)
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signout()
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
