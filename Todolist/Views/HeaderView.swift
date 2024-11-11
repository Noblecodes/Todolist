//
//  HeaderView.swift
//  Todolist
//
//  Created by Noble Udechukwu on 06/07/2024.
//

import SwiftUI

struct HeaderView: View {
    let title : String
    let subtitle : String
    let angle :  Double
    let background : Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title)
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 50))
                Text(subtitle)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .green)
}
