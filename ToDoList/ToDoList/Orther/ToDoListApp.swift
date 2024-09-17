//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by TEDDY 237 on 16/09/2024.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure() 
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
