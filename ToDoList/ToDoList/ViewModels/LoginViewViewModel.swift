//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by TEDDY 237 on 16/09/2024.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login() {
        guard validation() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validation() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            return false
        }
        
        // email@foo.com
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        return true
    }
}
