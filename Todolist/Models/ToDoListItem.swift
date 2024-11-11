//
//  ToDoListItem.swift
//  Todolist
//
//  Created by Noble Udechukwu on 03/07/2024.
//

import Foundation


struct ToDoListItem: Codable, Identifiable {
    let id: String
    let Title: String
    let dueDate: TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state : Bool){
        isDone = state
    }
}
