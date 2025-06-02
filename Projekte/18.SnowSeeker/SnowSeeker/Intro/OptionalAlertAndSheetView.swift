//
//  OptionalAlertAndSheetView.swift
//  SnowSeeker
//
//  Created by Phil Seißelberg on 27.05.25.
//

import SwiftUI

struct OptionalAlertAndSheetView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        VStack {
            //Sheet mit Optional:
            //Sobald selectedUser einen Wert hat wird Sheet mit diesem geöffnet
            //Nach Dismiss des Sheets wird selectedUser wieder auf nil gesetzt
            Button("Tap Me") {
                selectedUser = User()
                isShowingUser = true
            }
            .sheet(item: $selectedUser) { user in
                Text(user.id)
                    //Optionen, um Sheet kleiner zu machen
                    .presentationDetents([.medium, .large])
            }
            .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
                Button(user.id) {
                    
                }
            }
        }
    }
}

struct User: Identifiable {
    var id = "Steve Jobs"
}

#Preview {
    OptionalAlertAndSheetView()
}
