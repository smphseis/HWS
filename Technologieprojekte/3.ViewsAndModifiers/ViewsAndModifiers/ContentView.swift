//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Phil Seißelberg on 30.05.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello")
            .prominentBlue()
    }
}

struct BlueFont: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.blue)
    }
}

extension View {
    func prominentBlue() -> some View {
        modifier(BlueFont())
    }
}

#Preview {
    ContentView()
}
