//
//  ProfileView.swift
//  Todolist
//
//  Created by Noble Udechukwu on 03/07/2024.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                
            }
            .navigationTitle("Profile")
        }

    }
}

#Preview {
    ProfileView()
}
