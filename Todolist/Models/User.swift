//
//  User.swift
//  Todolist
//
//  Created by Noble Udechukwu on 03/07/2024.
//

import Foundation

struct User: Codable {
    // this is what a user is gonna look like andd the objects or variables in a model user 
    let name : String
    let Id : String
    let email : String
    let Joined : TimeInterval
    
}
