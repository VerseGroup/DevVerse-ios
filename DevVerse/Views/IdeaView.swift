//
//  IdeaView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import SwiftUI

struct IdeaView: View {
    
    @ObservedObject var api = APIRepository()
    @State var idea: Idea
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: idea.completed ? "checkmark.circle.fill" : "circle")
                Text(idea.name)
            }
            Text(idea.description)
            HStack {
                Spacer()
            }
        }
        .padding()
        .background(Color.green.opacity(0.2))
        .foregroundColor(Color.black)
        .cornerRadius(5)
        .onTapGesture {
            withAnimation(.easeIn) {
                self.api.editIdea(idea: idea)
                idea.completed.toggle()
                Task {
                    await self.api.getIdeas()
                }
            }
        }
    }
}
//
//struct IdeaView_Previews: PreviewProvider {
//    static var previews: some View {
//        IdeaView()
//    }
//}
