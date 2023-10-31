//
//  FeedView.swift
//  Instagram
//
//  Created by Alexandr Ananchenko on 20.10.2023.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Image("instagram_icon")
                        .resizable()
                        .frame(width: 100, height: 32)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            })
        }
    }
}

#Preview {
    FeedView()
}
