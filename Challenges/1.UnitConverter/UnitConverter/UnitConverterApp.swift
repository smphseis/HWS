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
