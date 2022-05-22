//
//  RouterView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import SwiftUI

struct RouterView: View {
    @EnvironmentObject var auth: AuthService
    
    var body: some View {
        if auth.authenticated {
            Text("Authenticated!")
        } else {
            AuthView()
        }
    }
}

struct RouterView_Previews: PreviewProvider {
    static var previews: some View {
        RouterView()
    }
}
