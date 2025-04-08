//
//  ExampleContentUnavailableView.swift
//  Instafilter
//
//  Created by Phil Seißelberg on 18.10.24.
//

import SwiftUI

struct ExampleContentUnavailableView: View {
    var body: some View {
        //ContentUnavailableView("No snippets", systemImage: "swift")
        //ContentUnavailableView("No snippets", systemImage: "swift", description: Text("You don't have any saved snippets yet."))
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ExampleContentUnavailableView()
}
