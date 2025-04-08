//
//  EdutainmentApp.swift
//  Edutainment
//
//  Created by Phil Seißelberg on 06.06.24.
//

import SwiftUI

@main
struct EdutainmentApp: App {
    
    @State private var game = Game()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(game)
        }
    }
}
