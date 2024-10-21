//
//  AnimationStackView.swift
//  Animations
//
//  Created by Phil Seißelberg on 04.06.24.
//

import SwiftUI

struct AnimationStackView: View {
    
    @State private var enabled = false
    
    var body: some View {
        HStack {
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .foregroundStyle(.white)
            //Eine Animation animiert nur Änderungen mit, die vor .animation() passieren
            //Wäre .clipShape hier nach .animation würde der Switch vom Viereck zur Abrundung nicht mit animiert
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.default, value: enabled)
            
            //Man kann auch mehrere .animation-Modifier verwenden, welche dann jeweils den Code der Modifier vor ihr bis zur vorherigen .animation animiert
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .animation(.default, value: enabled)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
            
            
            //Mit der Übergabe von nil können auch einzelne Animationen nachträglich ausgeschaltet werden
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .animation(nil, value: enabled)
            .foregroundStyle(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
        }
        .padding()
    }
}

#Preview {
    AnimationStackView()
}
