//
//  NotificationCardView.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import SwiftUI

struct NotificationCardView: View {
    
    var notification: Notification
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(notification.repository.full_name)
                .font(.subheadline)
            HStack {
                Text(notification.subject.title)
                    .font(.headline)
                Spacer()
                Text(notification.subject.type)
            }
            Text(notification.updated_at)
        }
        .padding()
        .frame(width: .infinity)
        .background(Color.blue.opacity(0.2))
        .foregroundColor(Color.black)
        .cornerRadius(5)
    }
}
//
//struct NotificationCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationCardView()
//    }
//}
