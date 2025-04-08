//
//  AnimationBindingView.swift
//  Animations
//
//  Created by Phil Seißelberg on 03.06.24.
//

import SwiftUI

struct AnimationBindingView: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        print(animationAmount)
        
        return VStack {
            //.animation() nur andere Schreibweise (statt "Change"-Wert im Parameter)
            //Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
            Stepper("Scale amount", value: $animationAmount.animation(
                .easeInOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount += 1
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
        }
    }
}

#Preview {
    AnimationBindingView()
}
