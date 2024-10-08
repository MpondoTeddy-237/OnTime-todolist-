//
//  ToDoListView.swift
//  ToDoList
//
//  Created by TEDDY 237 on 16/09/2024.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "user/\(userId)/todos"
        )
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    
    var body: some View {
        NavigationView {
            VStack{
                List(items) { item in
                    ToDoListItemsView(item: item)
                        .swipeActions{
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                        .listStyle(PlainListStyle())
                    
                }
                .navigationTitle("To Do List")
                .toolbar{
                    Button {
                        //Action
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.showingNewItemView) {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
                
            }
        }
    }
    
    #Preview {
        ToDoListView(userId: "")
    }
}
