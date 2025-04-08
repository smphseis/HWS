//
//  ConfirmationDialogView.swift
//  Instafilter
//
//  Created by Phil Seißelberg on 16.10.24.
//

import SwiftUI

struct ConfirmationDialogView: View {
    
    //ConfirmationDialog: Alert mit zusätzlichen Buttons
    //ConfirmationDialog swipt von unten hoch und kann im Gegensatz zum Alert auch mit tippen außerhalb des Borders dismmisst werden 
    
    @State private var showingConfirmationDialog = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Button("Hello, World!") {
            showingConfirmationDialog = true
        }
        .frame(width: 300, height: 300)
        .background(backgroundColor)
        .confirmationDialog("Change background", isPresented: $showingConfirmationDialog) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Blue") { backgroundColor = .blue }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Select a new color")
        }
    }
}

#Preview {
    ConfirmationDialogView()
}
