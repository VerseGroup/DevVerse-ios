//
//  HomeView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var auth: AuthService
    @StateObject var api: APIRepository = APIRepository()
    
    var body: some View {
        ScrollView {
            VStack {
                Text(auth.user?.email ?? "AAAAA")
                List {
                    ForEach(api.repos) { repo in
                        Text(repo.name)
                    }
                }
                .listStyle(.insetGrouped)
            }
        }
        .onAppear {
            Task {
                await api.getRepos()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
