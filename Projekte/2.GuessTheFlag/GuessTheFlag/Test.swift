//
//  Test.swift
//  GuessTheFlag
//
//  Created by Phil Seißelberg on 07.04.25.
//

import SwiftUI

struct Test: View {
    
    @State private var showAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showAlert = true
        }
        .alert("Important", isPresented: $showAlert) {
            Button("OK") {}
        } message: {
            Text("Test")
        }
    }
}

#Preview {
    Test()
}
