//
//  DevVerseApp.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import SwiftUI

@main
struct DevVerseApp: App {
    @StateObject var auth: AuthService = AuthService.instance
    
    var body: some Scene {
        WindowGroup {
            RouterView()
                .environmentObject(auth)
                .onOpenURL { url in
                    print("url: \(url.debugDescription)")
                    auth.github.handleOAuthURL(url: url)
                }
        }
    }
}
