//
//  CustomAnimationView.swift
//  Animations
//
//  Created by Phil Seißelberg on 03.06.24.
//

import SwiftUI

struct CustomAnimationView: View {
    
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
        //.animation(.linear, value: animationAmount)
        
        //Konfigurierbare Dauer in Sekunden
        //.animation(.easeInOut(duration: 2), value: animationAmount)
        
        //Spring(kann auch individuell angepasst werden)
            //duration = wie lange dauert Spring
            //bounciness: von 0 (nicht) bis zu 1 (oft)
        //.animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
        
        
        //Ausführen der Animation erst nach delay:
        //.animation(
        //    .easeInOut(duration: 2)
        //        .delay(1)
        //    value: animationAmount
        //)
        
        
        //.animation(
        //    .easeInOut(duration: 1)
        //        .repeatCount(3, autoreverses: true),
        //    value: animationAmount
        //)
        
        .animation(
            .easeInOut(duration: 1)
                .repeatForever(autoreverses: true),
            value: animationAmount
        )
    }
}

#Preview {
    CustomAnimationView()
}
