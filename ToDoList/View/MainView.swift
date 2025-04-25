//
//  ContentView.swift
//  ToDoList
//
//  Created by Sourav Sharma on 05/04/25.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        }
    else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListItemView(userId: viewModel.currentUserId, varName: viewModel.currentUserName)
                .tabItem{
                    Label("Home",systemImage: "house")
                }
        
        ProfileView()
            .tabItem{
            Label("Profile",systemImage: "person.circle")
        }
            }
    }
}

#Preview {
    MainView()
}
