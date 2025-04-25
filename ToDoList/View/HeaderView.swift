//
//  HeaderView.swift
//  ToDoList
//
//  Created by Sourav Sharma on 06/04/25.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subTitle: String
    let angle: Double
    let color: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: angle))
               
            VStack{
                Text(title)
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(Color.white)
                Text(subTitle)
                    .font(.system(size: 30, weight: .light))
                    .foregroundColor(Color.white)
            }
            .padding(.top,35)
        }.frame(width: UIScreen.main.bounds.width * 3, height: 350)
            .offset(y: -150)

    }
}

#Preview {
    HeaderView(title: "Title", subTitle: "Sub Title", angle: 30, color: Color.cyan)
}
