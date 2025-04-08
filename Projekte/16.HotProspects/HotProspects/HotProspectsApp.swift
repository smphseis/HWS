//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Phil Seißelberg on 24.10.24.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
