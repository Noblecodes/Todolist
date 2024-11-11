//
//  NewItemviewViewModel.swift
//  Todolist
//
//  Created by Noble Udechukwu on 03/07/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save () {
        guard canSave else {
            return
        }
        // get user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        // create a model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            Title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        
        // save it to the database
        let db = Firestore.firestore()
        
        db.collection("user")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave: Bool {
        //this is taking any space in the title and also making sure that the place or form title isnt empty
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        //addingtimeinterval makes it so that the current date is going to be yesterday due to the minus of 86400 seconds which is a day
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
}
