//
//  ContentView.swift
//  URLSessionChallenge
//
//  Created by Zoltan Vegh on 29/04/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    // Instead of @State, use a @Query
    //@State private var users = [User]()
    @Query(sort: \User.name) var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users, id: \.id) { user in
                NavigationLink(destination: DetailView(user: user)) {
                    HStack {
                        Text(user.name)
                        Spacer()
                        Circle()
                            .fill(user.isActive ? .green : .red)
                            .frame(width: 10, height: 10)
                    }
                }
            }
            .navigationTitle("FriendFace")
        }
        .task {
            if users.isEmpty {
                await loadData()
            }
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedResponse = try decoder.decode([User].self, from: data)
            
            // first clear the existing data
            for user in users {
                modelContext.delete(user)
            }
            
            // insert new users
            for user in decodedResponse {
                modelContext.insert(user)
            }
            
            // optional explicit save
            try modelContext.save()
            
        } catch {
            print("Failed to fetch or decode data: \(error.localizedDescription)")
        }
    }
}

//#Preview {
//    let config = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: User.self, configurations: config)
//    
//    // example data
//    let exampleFriend = Friend(id: "f1", name: "Example Friend")
//    let exampleUser = User(id: "123", name: "Zoltan", isActive: true, age: 30, company: "apple", email: "zoltan@apple.com", address: "35 Highfields, Carrigaline", registered: Date(), friends: [exampleFriend])
//    
//    // insert into the context
//    container.mainContext.insert(exampleUser)
//    
//    ContentView()
//        .modelContainer(container)
//}
