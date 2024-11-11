//
//  ContentView.swift
//  Todolist
//
//  Created by Noble Udechukwu on 02/07/2024.
//

import SwiftUI

struct Mainview: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            // signed in
            accountView
        } else {
            LoginView()
        }
    }
    //bottom nav bar
    @ViewBuilder
    var accountView: some View {
        TabView{
            CheckListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View{
        Mainview()
    }
}


