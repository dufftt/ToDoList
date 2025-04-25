//
//  NewItemView.swift
//  ToDoList
//
//  Created by Sourav Sharma on 05/04/25.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        VStack{
            Text("New Item")
                .bold()
                .font(.system(size: 32))
                .padding(.top,20)
            
            Form{
                //Title
                //Due Date
                //Button
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                DatePicker("Due Date",selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                Text("Due date: \(viewModel.dueDate, style: .date)")
                
                TLButton(title: "Add Item", bgcolor: .blue){
                    if(viewModel.canSave){
                        viewModel.save()
                        newItemPresented=false
                    }else{
                        viewModel.showAlert=true
                    }
                    
                    
                }.padding()
            }.background(RoundedRectangle(cornerRadius: 30))
        }.alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("Error"),
                  message: Text("Kindly provide a title and due date greater than today."))
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: {_  in}))
}
