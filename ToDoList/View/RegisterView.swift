//
//  RegisterView.swift
//  ToDoList
//
//  Created by Sourav Sharma on 05/04/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()

    var body: some View {
        NavigationView{
            VStack{
                HeaderView(title: "Register", subTitle: "Start Organising Today", angle: 15, color: Color.yellow)
                Spacer()
                Form{
                    if let message = viewModel.errorMessage{
                        Text(message)
                            .foregroundColor(.red)
                    }
                    TextField("Full Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password",text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Create Account", bgcolor: .green){
                        viewModel.register()
                    }
                    .padding()
                    
                }.offset(y:-50)
                
//                VStack{
//                    Text("Already have an Account?")
//                    NavigationLink (
//                        "Login", destination: LoginView()
//                    )
//                }.padding(.bottom,30)

            }
        }

            }
}

#Preview {
    RegisterView()
}
