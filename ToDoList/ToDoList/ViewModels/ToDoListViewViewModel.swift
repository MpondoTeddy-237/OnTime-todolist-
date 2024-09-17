//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by TEDDY 237 on 16/09/2024.
//

import FirebaseFirestore
import Foundation

///ViewModel for list of items view
///Primary tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    ///Delete to do list tem
    ///-parameter id: Item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
