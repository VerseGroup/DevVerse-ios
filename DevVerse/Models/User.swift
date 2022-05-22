//
//  User.swift
//  DevVerse
//
//  Created by Steven Yu on 5/21/22.
//

import Foundation

// devverse user
struct User: Codable {
    var id: Int
    var username: String
    var email: String
    var phone: String
    var name: String
    var token: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case email
        case phone
        case name
        case token = "github_oauth_token"
    }
}
