//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Sourav Sharma on 05/04/25.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel: ToDoListItemViewViewModel
    private let varName: String
    private let userId: String
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String, varName: String){
        self.userId = userId
        self.varName = varName
        self._items=FirestoreQuery(collectionPath: "Users/\(userId)/toDoItems")
        self._viewModel = StateObject(wrappedValue: ToDoListItemViewViewModel(userId: userId, varName: varName))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                //Text("Welcome to TODOList app - \(varName)")
                List(items){ item in
                    ToDoView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                    
                }
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    viewModel.showingNewItem = true
                }label: {
                    Image(systemName: "plus")
                }.sheet(isPresented: $viewModel.showingNewItem) {
                    NewItemView(newItemPresented: $viewModel.showingNewItem)
                }
            }
        }
    }
}

#Preview {
    ToDoListItemView(userId: "user id", varName: "Name")
}
