//
//  CheckListView.swift
//  Todolist
//
//  Created by Noble Udechukwu on 03/07/2024.
//
import FirebaseFirestoreSwift
import SwiftUI

struct CheckListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem]
  
    init(userId : String ){
        
        self._items = FirestoreQuery(
            collectionPath: "Users/\(n)todos")
    }
    var body: some View {
        NavigationView {
            VStack{
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button(action: {
                    viewModel.showingNewitemView = true 
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $viewModel.showingNewitemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewitemView)
            })
        }
    }
}

#Preview {
    CheckListView(userId: "")
}
