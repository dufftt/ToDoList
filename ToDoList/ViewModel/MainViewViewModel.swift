//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Sourav Sharma on 06/04/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    @Published var currentUserName: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                Task{
                    self?.currentUserName = await self?.getName() ?? "Stranger2"
                }
            }
        }
    }
    
    private func getName() async -> String {
        print("current user id in getName"+self.currentUserId)
        let db = Firestore.firestore()
        if(self.currentUserId.isEmpty){
            return "Stranger"
        }
        else{
            do{
                
                let doc = db.collection("Users").document(self.currentUserId)
                
                let docName = try await doc.getDocument(source: .cache)
                if docName.exists{
                    let name = docName.get("name") as! String
                    print("fetched Name"+name)
                    return name
                }
            }catch let signOutError as NSError {
                print("Error getting name: %@", signOutError)
            }
            return "Stranger"
        }
    }
        public var isSignedIn: Bool {
            return Auth.auth().currentUser != nil
        }
    
    
}
