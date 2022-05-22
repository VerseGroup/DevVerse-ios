//
//  AuthService.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import Foundation
import Combine

class AuthService: ObservableObject {
    static let instance = AuthService()
    
    var github: GitHubService = GitHubService()
    var api: APIService = APIService()
    
    @Published var signingUp: Bool = false
    
    @Published var authenticated: Bool = false
    @Published var user: User? = nil
    
    @Published var phone: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    private init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        github.$token
            .dropFirst()
            .sink { token in
                if let token = token {
                    if self.signingUp {
                        print("Signing up")
                        Task {
                            await self.signUp(token: token, phone: self.phone)
                        }
                    } else {
                        print("Signing in")
                        Task {
                            await self.signIn(token: token)
                        }
                    }
                } else {
                    print("token is nil")
                }
            }
            .store(in: &cancellables)
    }
    
    func loadCurrentUser() {
        
    }
    
    // returns User model
    @MainActor
    func signIn(token: String) async {
        self.user = await api.signIn(token: token)
        self.authenticated = true
    }
    
    @MainActor
    func signUp(token: String, phone: String) async {
        self.user = await api.signUp(token: token, phone: "+1\(phone)")
        self.authenticated = true
    }
}
