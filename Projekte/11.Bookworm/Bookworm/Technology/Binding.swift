//
//  Binding.swift
//  Bookworm
//
//  Created by Phil Seißelberg on 30.09.24.
//

//Verwende @Binding, um einen Wert zwischen Views (beidseitig) zu teilen -> beispielsweise Toggle

//Unterschied @Binding vs Bindable
//@Binding
//  - Nutzung für einfache Daten wie Boolean, Double, String-Array ohne @Observable-Nutzung
//@Bindable
//  - Nutzung für "komplexere Daten" -> Klasse welche @Observable nutzt

//@Binding eignet sich besonders, wenn CustomUI Elemente geschrieben werden sollen

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct MainView: View {
    
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "RememberMe", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}


#Preview {
    MainView()
}
