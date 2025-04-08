//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Phil Seißelberg on 30.09.24.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
