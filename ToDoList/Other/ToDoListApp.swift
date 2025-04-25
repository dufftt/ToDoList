//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Sourav Sharma on 05/04/25.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
