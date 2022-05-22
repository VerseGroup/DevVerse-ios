//
//  RepoCardView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import SwiftUI

struct RepoCardView: View {
    var repository: Repository
    
    @State var showDetailView: Bool = false
    
    var body: some View {
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
        .padding()
        .background(Color.purple.opacity(0.2))
        .cornerRadius(5)
        .onTapGesture {
            showDetailView.toggle()
        }
        .sheet(isPresented: $showDetailView) {
            RepoDetailView(repository: repository)
        }
    }
}
//
//struct RepoCardView_Previews: PreviewProvider {
//    static var previews: some View {
////        RepoCardView()
//    }
//}
