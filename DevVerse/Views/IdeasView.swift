//
//  IdeasView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import SwiftUI

struct IdeasView: View {
    @EnvironmentObject var auth: AuthService
    @StateObject var api: APIRepository = APIRepository()
    
    @State var showNewIdeaView: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(api.ideas, id:\.self) { idea in
                        IdeaView(idea: idea)
                    }
                }
                .padding()
            }
            .navigationTitle("Ideas")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "plus.circle.fill")
                        .onTapGesture {
                            showNewIdeaView.toggle()
                        }
                }
            }
        }
        .onAppear(perform: {
            Task {
                await api.getIdeas()
            }
        })
        .sheet(isPresented: $showNewIdeaView) {
            NewIdeaView()
        }
    }
}

struct IdeasView_Previews: PreviewProvider {
    static var previews: some View {
        IdeasView()
    }
}
