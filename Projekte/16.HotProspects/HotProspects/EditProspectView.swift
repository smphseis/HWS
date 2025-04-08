//
//  EditProspectView.swift
//  HotProspects
//
//  Created by Phil Seißelberg on 10.11.24.
//

import SwiftUI

struct EditProspectView: View {
    
    @Bindable var prospect: Prospect
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $prospect.name)
                    .textContentType(.name)
                    .font(.title)
                
                TextField("Email address", text: $prospect.emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                Button("Save") {
                    dismiss()
                }
            }
            .navigationTitle("Update contact info")
        }
    }
}

