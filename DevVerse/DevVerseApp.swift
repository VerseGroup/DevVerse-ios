//
//  DevVerseApp.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import SwiftUI
import OAuthSwift

@main
struct DevVerseApp: App {
    var body: some Scene {
        WindowGroup {
            AuthView()
                .onOpenURL { url in
                    print("url: \(url.debugDescription)")
                }
        }
    }
}
