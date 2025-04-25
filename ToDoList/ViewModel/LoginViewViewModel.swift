//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Sourav Sharma on 06/04/25.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    var emailRegex = "^[a-zA-Z0-9_.±]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$"
    init() {
        
    }
    
    func login(){
        guard validate() else {
            return
        }
        errorMessage = nil
        Auth.auth().signIn(withEmail: email, password: password){ (authDataResult, error) in
            if let error = error {
                // Check for invalid login credentials error
                self.errorMessage = "Kindly pass correct username and password"
                print("Login error: \(error)")
            } else {
                // Successful sign in
                print("User logged in successfully")
            }
        }
        
        
    }
    
    
    private func validate() -> Bool{
        errorMessage = nil
        print("email: "+email+" Password: "+password)
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter email and password"
            return false
        }
        
        guard email.range(of: emailRegex, options: .regularExpression) != nil
                else {
            errorMessage = "Invalid email format"
            return false
        }
        return true
    }
}
