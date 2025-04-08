//
//  ContentView.swift
//  Animations
//
//  Created by Phil Seißelberg on 02.06.24.
//

import SwiftUI

struct ImplicitAnimationView: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        //Implizit: Wenn Wert verändert wird => Animation ausführen
        //.default unter iOS = Spring-Effekt
        .animation(.default, value: animationAmount)
        //Effektfolge: 0,3,6,9,... Points Blur
        .blur(radius: (animationAmount - 1) * 3)
    }
}

#Preview {
    ImplicitAnimationView()
}
