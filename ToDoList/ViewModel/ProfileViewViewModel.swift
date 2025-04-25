//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Sourav Sharma on 06/04/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class ProfileViewViewModel: ObservableObject {
    @Published var user:User? = nil
    init(){}
    
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("Users").document(userId).getDocument{[weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            DispatchQueue.main.async{
                self?.user = User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  dateJoined: data["dateJoined"] as? TimeInterval ?? 0)
            }
            
        }
    }
    
    func signout(){
        do {
            try Auth.auth().signOut()
            print("Signout Successful")
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
       
        
    }
    
    func logout(){
        
    }
}
