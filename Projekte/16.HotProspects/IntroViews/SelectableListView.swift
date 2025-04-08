//
//  SelectableListView.swift
//  HotProspects
//
//  Created by Phil Seißelberg on 24.10.24.
//

import SwiftUI

struct SelectableListView: View {
    
    @State private var selection = Set<String>()
    
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]

    var body: some View {
        NavigationStack {
            List(users, id: \.self, selection: $selection) { user in
                Text(user)
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

#Preview {
    SelectableListView()
}
