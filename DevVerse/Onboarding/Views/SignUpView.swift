//
//  SignUpView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var vm: AuthService
    @Environment(\.presentationMode) var presentationMode
    
    let url: URL = URL(string: "https://github.com/login/oauth/authorize?client_id=\(clientId)&scope=repo%20repo_deployment%20admin:repo_hook%20admin:org%20admin:public_key%20admin:org_hook%20gist%20notifications%20user%20delete_repo%20write:discussion%20write:packages%20read:packages%20admin:gpg_key%20codespace%20workflow")!
    
    var body: some View {
        VStack {
            Form {
                Section("Phone Number") {
                    TextField("Phone", text: $vm.phone)
                        .keyboardType(.phonePad)
                }
                
                Section("GitHub Integration") {
                    Link(destination: url) {
                        Label {
                            Text("Complete sign up with GitHub")
                        } icon: {
                            Image("github-light")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                        .disabled(vm.phone.isEmpty)
                    }
                    .environment(\.openURL, OpenURLAction { url in
                        print("Link clicked")
                        presentationMode.wrappedValue.dismiss()
                        return .systemAction
                    })
                }

            }
        }
        .navigationTitle("Sign Up")
        .onAppear {
            print("Signing up view init")
            vm.signingUp.toggle()
        }
        .onDisappear {
            print("Signing up view denit")
//            vm.signingUp.toggle()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
