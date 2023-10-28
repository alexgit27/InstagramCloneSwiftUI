//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Alexandr Ananchenko on 28.10.2023.
//

import Foundation
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
