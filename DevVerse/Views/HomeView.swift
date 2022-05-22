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
            VStack(alignment: .leading) {
                Text("Welcome to DevVerse,")
                    .font(.title)
                    .bold()
                Text(auth.user?.name ?? "AAAAAA")
                    .font(.largeTitle)
                    .bold()
                
                ForEach(api.repos) { repo in
                    RepoCardView(repository: repo)
                }
            }
            .padding()
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
