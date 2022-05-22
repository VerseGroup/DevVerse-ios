//
//  AppView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            IdeasView()
                .tabItem {
                    Image(systemName: "lightbulb")
                }
            
            NotificationsView()
                .tabItem {
                    Image(systemName: "bell.fill")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
