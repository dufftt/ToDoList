//
//  LoginView.swift
//  ToDoList
//
//  Created by Sourav Sharma on 05/04/25.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack{
                //ToDo Header
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, color: Color.cyan)
                Spacer()
                
                Form{
                    if let message = viewModel.errorMessage{
                        Text(message)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password",text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Login", bgcolor: .blue){
                        viewModel.login()
                    }
                    .padding()
                    
                }
                .offset(y:-50)
                //ToDo Login Page
                
                //ToDo Create Account
                VStack{
                    Text("New Around Here?")
                    NavigationLink (
                        "Create Account", destination: RegisterView()
                    )
                }.padding(.bottom,30)
            }
        }}
}

#Preview {
    LoginView()
}
