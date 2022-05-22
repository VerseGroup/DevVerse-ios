//
//  Repository.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import Foundation

struct GitHubMessage: Codable {
    var message: String
    var response: String
}

struct Repository: Identifiable, Codable {
    var id: Int
    var name: String
    var description: String?
    var updated_at: String
    var stargazers_count: Int
}
