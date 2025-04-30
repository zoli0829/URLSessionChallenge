//
//  URLSessionChallengeApp.swift
//  URLSessionChallenge
//
//  Created by Zoltan Vegh on 29/04/2025.
//

import SwiftData
import SwiftUI

@main
struct URLSessionChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [User.self, Friend.self])
        }
    }
}
