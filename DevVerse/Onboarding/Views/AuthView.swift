//
//  AuthView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import SwiftUI

struct AuthView: View {
    
    let url: URL = URL(string: "https://github.com/login/oauth/authorize?client_id=\(clientId)")!
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Sign in with GitHub to get started with DevVerse")
                        .font(.headline)
                    Spacer()
                }
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                Link(destination: url) {
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
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Welcome")
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
