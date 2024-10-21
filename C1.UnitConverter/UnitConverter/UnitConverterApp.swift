//
//  UnitConverterApp.swift
//  UnitConverter
//
//  Created by Phil Seißelberg on 02.03.24.
//

import SwiftUI

@main
struct UnitConverterApp: App {
    var body: some Scene {
        MenuBarExtra("UnitConverter", systemImage: "pencil.and.ruler") {
            MenuView()
        }
        .menuBarExtraStyle(.window)
    }
}
