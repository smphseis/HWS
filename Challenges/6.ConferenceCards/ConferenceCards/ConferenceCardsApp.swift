//
//  ConferenceCardsApp.swift
//  ConferenceCards
//
//  Created by Phil Seißelberg on 23.10.24.
//

import SwiftData
import SwiftUI

@main
struct ConferenceCardsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Contact.self)
        }
    }
}
