//
//  ProfileView.swift
//  ToDoList
//
//  Created by Sourav Sharma on 05/04/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
                VStack{
                    if let user = viewModel.user{
                        profile(user: user)
                }else{
                    Text("Loading....")
                }
            }
                .navigationTitle("Profile")
//            .toolbar{
//                Button{
//                    viewModel.signout()
//                }label: {
//                    Image(systemName: "rectangle.portrait.and.arrow.right")
//                }
//            }
        }
        
        
        
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View{
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
        // .padding()
        VStack{
            HStack{
                Text("Name:")
                    .bold()
                Text(user.name)
            }
            HStack{
                Text("Email:")
                    .bold()
                Text(user.email)
            }
            
            HStack{
                Text("Member Since:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.dateJoined).formatted(date: .abbreviated,time: .shortened))")
            }
            
        }
        .padding()
        Button{
            viewModel.signout()
        }label: {
            Image(systemName: "rectangle.portrait.and.arrow.right")
                .imageScale(Image.Scale.large)
        }
        .tint(.red)
        .padding()
       
    }
}

#Preview {
    ProfileView()
}
