//
//  DetailView.swift
//  URLSessionChallenge
//
//  Created by Zoltan Vegh on 29/04/2025.
//

import SwiftUI

struct DetailView: View {
    var user: User
    
    var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name: \(user.name)")
                    Text("Active: \(user.isActive ? "Yes" : "No")")
                    Text("Age: \(user.age)")
                    Text("Company: \(user.company)")
                    Text("Email: \(user.email)")
                    Text("Address: \(user.address)")
                    Text("Registered: \(formatter.string(from: user.registered))")

                    Divider()
                    
                    Text("Friends")
                        .font(.headline)
                    
                    ForEach(user.friends, id: \.id) { friend in
                        Text(friend.name)
                    }
                }
                .padding()
            }
            .navigationTitle(user.name)
        }
}

#Preview {
    DetailView(user: User(
        name: "Zoltan",
        isActive: true,
        id: "123456789",
        age: 30,
        company: "Apple",
        email: "zoltan@apple.com",
        address: "35 High Street, London",
        friends: [Friend(id: "1", name: "Daniel"), Friend(id: "2", name: "Virag")],
        registered: Date() // <-- Pass a Date here
    ))
}
