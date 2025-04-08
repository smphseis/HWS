//
//  TextEditor.swift
//  Bookworm
//
//  Created by Phil Seißelberg on 30.09.24.
//
import SwiftUI

//TextEditor ermöglicht Multiline-Strings
//TextField kann aber auch so konfiguriert werden, dass mit Zeilen mitgegangen wird (ähnlich iMessage):

struct MultilineTextFieldDemoView: View {
    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationStack {
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

//TextEditor sollte nicht über die SafeArea hinausgehen -> Einbetten in NavigationStack, Form, ...

struct NotesApp: View {
    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationStack {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    MultilineTextFieldDemoView()
}
