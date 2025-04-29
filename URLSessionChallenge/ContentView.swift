//
//  ContentView.swift
//  URLSessionChallenge
//
//  Created by Zoltan Vegh on 29/04/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
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
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                users = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
}
