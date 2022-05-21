//
//  AuthView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack {
            Text("Welcome to DevVerse!")
            
            NavigationLink {
                GitHubAuthView()
            } label: {
                Label {
                    Text("Sign in with GitHub")
                } icon: {
                    Image("github-light")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                .foregroundColor(Color.white)
                .padding()
                .background(Color.black)
                .cornerRadius(10)
            }


        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
