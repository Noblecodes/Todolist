//
//  LoginViewViewModel.swift
//  Todolist
//
//  Created by Noble Udechukwu on 03/07/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation


class LoginViewViewModel: ObservableObject{
    @Published var Email  = ""
    @Published var Password  = ""
    @Published var errorMessage = ""
    init(){}
    
    
    func login(){
        guard validate() else {
            return
        }
        //try to log
        Auth.auth().signIn(withEmail: Email, password: Password)
    }
   
    private func validate() -> Bool{
        errorMessage = ""
        guard !Email.trimmingCharacters(in: .whitespaces).isEmpty,
              !Password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill in all the fields."
            return false
        }
        errorMessage = ""
        guard Email.contains("@") && Email.contains(".") else{
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
}
