//
//  DevVerseApp.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import SwiftUI

@main
struct DevVerseApp: App {
    @StateObject var github: GitHubService = GitHubService()
    
    var body: some Scene {
        WindowGroup {
            AuthView()
                .onOpenURL { url in
                    print("url: \(url.debugDescription)")
                    github.handleOAuthURL(url: url)
                }
        }
    }
}
