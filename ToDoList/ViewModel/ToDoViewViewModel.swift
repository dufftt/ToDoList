//
//  ToDoViewViewModel.swift
//  ToDoList
//
//  Created by Sourav Sharma on 06/04/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoViewViewModel: ObservableObject {
    init(){}
    
    func setCompleted(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setCompleted(!item.isCompleted)
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let db = Firestore.firestore()
        
        db.collection("Users").document(uid).collection("toDoItems").document(itemCopy.id).updateData(["isCompleted": itemCopy.isCompleted])
       // db.collection("Users")
       //.document(uid).collection("toDoItems")
       //.document(itemCopy.id).setData(itemCopy.asDictionary())
    }
    
}
