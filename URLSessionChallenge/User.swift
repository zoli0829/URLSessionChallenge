//
//  User.swift
//  URLSessionChallenge
//
//  Created by Zoltan Vegh on 29/04/2025.
//

import Foundation

struct User: Codable {
    
    let name: String
    let isActive: Bool
    let id: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let friends: [Friend]
    let registered: Date
    
    init(name: String, isActive: Bool, id: String, age: Int, company: String, email: String, address: String, friends: [Friend], registered: Date) {
        self.name = name
        self.isActive = isActive
        self.id = id
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.friends = friends
        self.registered = registered
    }
}
