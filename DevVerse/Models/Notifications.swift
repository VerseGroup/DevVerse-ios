//
//  Notifications.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import Foundation

struct Notification: Codable, Identifiable {
    var id: String
    var repository: NotificationRepo
    var subject: NotificationSubject
    var unread: Bool
    var updated_at: String
}

struct NotificationSubject: Codable {
    var title: String
    var type: String
}

struct NotificationRepo: Codable, Identifiable {
    var id: Int
    var full_name: String
    var html_url: String
    var description: String
}
