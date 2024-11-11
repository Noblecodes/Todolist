//
//  LoginView.swift
//  Todolist
//
//  Created by Noble Udechukwu on 03/07/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var ViewModel = LoginViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                //header
                HeaderView(title: "To Do List", subtitle: "Get Things Done", angle: 15, background: .pink)
                //form
               
                Form{
                    if !ViewModel.errorMessage.isEmpty {
                        Text(ViewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email Address", text: $ViewModel.Email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    SecureField("Enter password", text: $ViewModel.Password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TDLButtonView(title: "Log In",
                                  background: .blue)
                    {
                        //Attempt to log in
                        ViewModel.login()
                    }
                   
                  
                }
                .offset(y: -50)
                //register
                VStack{
                    Text("New Around Here")
                    
                    NavigationLink("Sign Up", destination: RegisterView())
                    
                }
                .padding(.bottom, 40)
                
            }
            
        }
        Spacer()
    }
}

#Preview {
    LoginView()
}
