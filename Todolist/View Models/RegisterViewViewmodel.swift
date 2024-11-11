//
//  RegisterViewViewmodel.swift
//  Todolist
//
//  Created by Noble Udechukwu on 03/07/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewViewmodel: ObservableObject {
    @Published var name  = ""
    @Published var password  = ""
    @Published var emailAddress = ""
    init(){}
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: emailAddress, password: password) {[weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            self?.InsertUserRecord(id: userID)
        }
    }
    private func InsertUserRecord(id: String) {
        let newUser = User(name: name
                           , Id: id,
                           email: emailAddress,
                           Joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("Users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !emailAddress.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            return false
        }
        guard emailAddress.contains("@") && emailAddress.contains(".")
            else{
                return false
            }
        guard password.count >= 6
        else{
           return false
        }
        return true
    }
}
