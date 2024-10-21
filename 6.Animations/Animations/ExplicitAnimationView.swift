//
//  ExplicitAnimationView.swift
//  Animations
//
//  Created by Phil Seißelberg on 03.06.24.
//

import SwiftUI

struct ExplicitAnimationView: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            //Explizite Animation, daher Wert mit withAnimation einpacken
            //Bei Implizit wurde zu beobachtender Wert ja direkt im .animation Parameter übergeben
            //Weitere Einstellmöglichkeiten bei withAnimation optional möglich
            //withAnimation {
                //eine komplette Umdrehung
                //animationAmount += 360
            //}
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        //Mit Axis kann die Axe gesteuert werden, in welche sich die Animation dreht
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0, z: 0))
    }
}

#Preview {
    ExplicitAnimationView()
}
