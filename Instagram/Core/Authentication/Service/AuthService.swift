//
//  AuthService.swift
//  Instagram
//
//  Created by Alexandr Ananchenko on 27.10.2023.
//

import Foundation
import FirebaseAuth

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: withEmail, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Error occur in signIn: \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Error occur in createUser: \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}
