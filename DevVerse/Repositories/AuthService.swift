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
        Task {
            await loadCurrentUser()
        }
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
//                        Task {
//                            await self.signIn(token: token)
//                        }
                    }
                } else {
                    print("token is nil")
                }
            }
            .store(in: &cancellables)
    }
    
    // loads user if exists
    func loadCurrentUser() async {
        guard
            let token = UserDefaults.standard.string(forKey: "token")
        else {
            authenticated = false
            return
        }
        await signIn(token: token)
    }
    
    // returns User model
    @MainActor
    func signIn(token: String) async {
        self.user = await api.signIn(token: token)
        self.authenticated = true
        // persistence
        UserDefaults.standard.set(token, forKey: "token")
    }
    
    @MainActor
    func signUp(token: String, phone: String) async {
        self.user = await api.signUp(token: token, phone: "+1\(phone)")
        self.authenticated = true
        // persistence
        UserDefaults.standard.set(token, forKey: "token")
    }
}
