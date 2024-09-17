//
//  User.swift
//  ToDoList
//
//  Created by TEDDY 237 on 16/09/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
