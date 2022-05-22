//
//  RepoDetailView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import SwiftUI

struct RepoDetailView: View {
    @ObservedObject var api = APIRepository()
    
    var repository: Repository
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(repository.name)
                        .font(.headline)
                    Spacer()
                    Label("\(repository.stargazers_count)", systemImage: "star.fill")
                }
                Text(repository.description ?? "No description")
                    .font(.body)
                Text(repository.updated_at)
            }
            
            Spacer()
            
            Button {
                api.addHook(repo: repository.name)
            } label: {
                Text("Add text notifications to this repository!")
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(5)
            }
        }
        .padding()
        .background(Color.purple.opacity(0.2))
    }
}

//struct RepoDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        RepoDetailView()
//    }
//}
