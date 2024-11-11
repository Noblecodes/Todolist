//
//  RegisterView.swift
//  Todolist
//
//  Created by Noble Udechukwu on 03/07/2024.
//

import SwiftUI

struct RegisterView: View {
 @StateObject var viewModel = RegisterViewViewmodel()
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start Organising", angle: -14, background: .yellow)
            
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Enter Email Address", text: $viewModel.emailAddress)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("Create password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    
                TDLButtonView(title: "Create Account",
                              background: .green)
                {
                    viewModel.register()
                    //Attempt to Registration
                }
                
            }
            
            .offset(y: -50)
        }
        Spacer()
    }
}

#Preview {
    RegisterView()
}
