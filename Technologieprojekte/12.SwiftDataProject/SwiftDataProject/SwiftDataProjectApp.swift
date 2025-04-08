//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Phil Seißelberg on 04.10.24.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
