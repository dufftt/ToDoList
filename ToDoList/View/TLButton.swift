//
//  TLButton.swift
//  ToDoList
//
//  Created by Sourav Sharma on 08/04/25.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let bgcolor: Color
    let action: () -> Void
    var body: some View {
        Button{
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgcolor)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }  }
}

#Preview {
    TLButton(title: "Title", bgcolor: .blue){
        
    }
}
