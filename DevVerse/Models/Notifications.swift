//
//  Notifications.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import Foundation

struct Notification: Codable {
    var repositoryName: String
    var url: String
    var unread: Bool
    var updatedAt: String
    var title: String
    var type: String
    
    enum CodingKeys: String, CodingKey {
        case repositoryName = "repository_name"
        case url
        case unread
        case updatedAt = "updated_at"
        case title
        case type
    }
}
