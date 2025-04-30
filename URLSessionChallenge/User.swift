//
//  User.swift
//  URLSessionChallenge
//
//  Created by Zoltan Vegh on 29/04/2025.
//

import Foundation
import SwiftData

@Model
class User: Codable {
        enum CodingKeys: String, CodingKey {
                case id, name, isActive, age, company, email, address, registered, friends
            }
    
    var name: String
    var isActive: Bool
    var id: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var friends: [Friend]
    var registered: Date
    
    init(id: String, name: String, isActive: Bool, age: Int, company: String, email: String, address: String, registered: Date, friends: [Friend] = []) {
            self.id = id
            self.name = name
            self.isActive = isActive
            self.age = age
            self.company = company
            self.email = email
            self.address = address
            self.registered = registered
            self.friends = friends
        }
    
    required convenience init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            let id = try container.decode(String.self, forKey: .id)
            let name = try container.decode(String.self, forKey: .name)
            let isActive = try container.decode(Bool.self, forKey: .isActive)
            let age = try container.decode(Int.self, forKey: .age)
            let company = try container.decode(String.self, forKey: .company)
            let email = try container.decode(String.self, forKey: .email)
            let address = try container.decode(String.self, forKey: .address)
            let registered = try container.decode(Date.self, forKey: .registered)
            let friends = try container.decode([Friend].self, forKey: .friends)
            
            self.init(id: id, name: name, isActive: isActive, age: age, company: company, email: email, address: address, registered: registered, friends: friends)
        }
    
    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
        
            try container.encode(id, forKey: .id)
            try container.encode(name, forKey: .name)
            try container.encode(isActive, forKey: .isActive)
            try container.encode(age, forKey: .age)
            try container.encode(company, forKey: .company)
            try container.encode(email, forKey: .email)
            try container.encode(address, forKey: .address)
            try container.encode(registered, forKey: .registered)
            try container.encode(friends, forKey: .friends)
        }
}
