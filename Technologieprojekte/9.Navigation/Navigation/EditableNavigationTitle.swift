//
//  EditableNavigationTitle.swift
//  Navigation
//
//  Created by Phil Seißelberg on 20.06.24.
//

import SwiftUI

struct EditableNavigationTitle: View {
    
    @State private var title = "SwiftUI"
    
    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    EditableNavigationTitle()
}
