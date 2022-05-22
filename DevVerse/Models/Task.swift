//
//  Task.swift
//  DevVerse
//
//  Created by Steven Yu on 5/22/22.
//

import Foundation

struct Task: Hashable, Codable {
    var id: Int
    var userId: String
    var name: String
    var description: String
    var completed: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case name
        case description
        case completed
    }
}

struct TodoList: Hashable, Codable {
    var id: Int
    var tasksIds: String
    var name: String
    var description: String
    var tasks: [Int] // task ids
    
    enum CodingKeys: String, CodingKey {
        case id
        case tasksIds = "tasks_ids"
        case name
        case description
        var tasks = "tasks_ids"
    }
}
