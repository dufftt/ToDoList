//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Sourav Sharma on 06/04/25.
//

import Foundation
import FirebaseFirestore

class ToDoListItemViewViewModel: ObservableObject {
    @Published var showingNewItem: Bool = false
    
    private let userId: String
    private let varName: String
    
    init(userId: String, varName: String){
        self.userId = userId
        self.varName = varName
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("Users")
            .document(userId)
            .collection("toDoItems")
            .document(id)
            .delete()
    }
}
