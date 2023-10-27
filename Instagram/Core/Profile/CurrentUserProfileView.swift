//
//  CurrentUserProfileView.swift
//  Instagram
//
//  Created by Alexandr Ananchenko on 25.10.2023.
//

import SwiftUI

struct CurrentUserProfileView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
         NavigationStack {
             ScrollView {
                
                VStack(spacing: 10) {
                    HStack {
                        Image("black_panther")
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
                        Text("Chadwick Boseman")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("Wakanda Forever")
                            .font(.footnote)
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
                
                LazyVGrid(columns: gridItems, spacing: 1, content: {
                    ForEach(0 ... 15, id: \.self) { _ in
                        Image("black_panther")
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageDimension, height: imageDimension)
                            .clipped()
                    }
                })
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
    CurrentUserProfileView()
}
