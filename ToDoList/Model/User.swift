//
//  User.swift
//  ToDoList
//
//  Created by Sourav Sharma on 05/04/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let dateJoined: TimeInterval
}
