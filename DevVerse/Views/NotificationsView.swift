//
//  NotificationsView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import SwiftUI

struct NotificationsView: View {
    @StateObject var api: APIRepository = APIRepository()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Notifications")
                    .font(.title)
                    .bold()
                
                ForEach(api.notifications) { notification in
                    NotificationCardView(notification: notification)
                }
            }
            .padding()
        }
        .onAppear {
            Task {
                await api.getNotifications()
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
