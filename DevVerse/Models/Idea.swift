//
//  Idea.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import Foundation

struct Idea: Codable, Hashable {
    var id: Int
    var name: String
    var description: String
    var userId: Int
    var completed: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case userId = "user_id"
        case completed
    }
}
