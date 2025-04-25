//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Sourav Sharma on 06/04/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    var emailRegex = "^[a-zA-Z0-9_.±]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$"
    var passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$"
    init(){
        
    }
    func register(){
        guard validate() else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUser(id: userId)
        }
    }
    
    private func insertUser(id: String){
        let newUser = User(id: id, name: name, email: email,dateJoined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        print("Inserting: "+newUser.name+" "+newUser.email)
        db.collection("Users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool{
        errorMessage = nil
        print("email: "+email+" Password: "+password)
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter name, email and password"
            return false
        }
        
        guard email.range(of: emailRegex, options: .regularExpression) != nil
                else {
            errorMessage = "Invalid email format"
            return false
        }
        
        guard password.range(of: passwordRegex, options: .regularExpression) != nil
        else{
            errorMessage = "Password must be at least 8 characters long and include at least one uppercase, lowercase and numeric character"
            return false
        }
        return true
        
    }
}
