//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Sourav Sharma on 05/04/25.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isCompleted: Bool
    
    mutating func setCompleted(_ completed: Bool) {
        self.isCompleted = completed
    }
}
