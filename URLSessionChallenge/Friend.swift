//
//  Friend.swift
//  URLSessionChallenge
//
//  Created by Zoltan Vegh on 29/04/2025.
//

import Foundation
import SwiftData

@Model
class Friend: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(name, forKey: .name)
        }
}
