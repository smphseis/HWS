//
//  ContentView.swift
//  ConferenceCards
//
//  Created by Phil Seißelberg on 23.10.24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var showAddContactView = false
    @Query var contacts: [Contact]
    
    let columns = Array(repeating: GridItem(.adaptive(minimum: 80)), count: 3)

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(contacts, id: \.self) { contact in
                        NavigationLink {
                            ContactView(contact: contact)
                        } label: {
                            ContactGridView(contact: contact)
                                .frame(height: 180)
                        }
                    }
                }
            }
            .padding(10)
            .navigationTitle("ConferenceCards")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Contact", systemImage: "plus", action: { showAddContactView = true })
                }
            }
            .sheet(isPresented: $showAddContactView) {
                AddContactView()
            }
        }
    }
}

#Preview {
    ContentView()
}


