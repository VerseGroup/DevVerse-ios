//
//  NewIdeaView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import SwiftUI

struct NewIdeaView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var api = APIRepository()
    
    @State var name: String = ""
    @State var description: String = ""
    
    var body: some View {
        VStack {
            Text("Add Idea")
                .font(.title2)
                .bold()
            Form {
                TextField("Idea name", text: $name)
                TextField("Description name", text: $description)
                Button {
                    Task {
                        await api.addIdea(ideaName: name, ideaDescription: description)
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text("Create idea!")
                }
            }
        }
        .padding()
    }
}

struct NewIdeaView_Previews: PreviewProvider {
    static var previews: some View {
        NewIdeaView()
    }
}
