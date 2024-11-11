//
//  TodolistApp.swift
//  Todolist
//
//  Created by Noble Udechukwu on 02/07/2024.
//

import FirebaseCore
import SwiftUI

@main
struct TodolistApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            Mainview()
        }
    }
}
