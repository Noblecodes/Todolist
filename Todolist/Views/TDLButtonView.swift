//
//  TDLButtonView.swift
//  Todolist
//
//  Created by Noble Udechukwu on 09/07/2024.
//

import SwiftUI

struct TDLButtonView: View {
    let title : String
    let background : Color
    let Action: () -> Void
    var body: some View {
        Button(action: {
            //Atempt login
            Action()
        }, label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .bold()
                    .foregroundColor(.white)
            }
        })
        .padding()
    }
}

#Preview {
    TDLButtonView(title: "value", background: .blue) {
        //Action
    }
}
