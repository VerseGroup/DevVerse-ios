//
//  AuthView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import SwiftUI

struct AuthView: View {
    
    @EnvironmentObject var vm: AuthService
    
    @State var showSignUpView: Bool = false
    
    let url: URL = URL(string: "https://github.com/login/oauth/authorize?client_id=\(clientId)&scope=repo%20repo_deployment%20admin:repo_hook%20admin:org%20admin:public_key%20admin:org_hook%20gist%20notifications%20user%20delete_repo%20write:discussion%20write:packages%20read:packages%20admin:gpg_key%20codespace%20workflow")!
    
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
                
                Button {
                    showSignUpView.toggle()
                } label: {
                    Label {
                        Text("Sign up with GitHub")
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
        .sheet(isPresented: $showSignUpView) {
            SignUpView()
                .environmentObject(vm)
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
