//
//  AnimationGestureView.swift
//  Animations
//
//  Created by Phil Seißelberg on 04.06.24.
//

import SwiftUI

struct AnimationGestureView: View {
    
    @State private var dragAmount = CGSize.zero
    
    
    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    //Trage ein, wie weit die View vom Startpunkt entfernt
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        withAnimation(.bouncy) { //Explizite Animation: Kann nur den Release anmimieren
                            dragAmount = .zero
                        }
                    }
            )
            //Alternativ Implizite Option: Animiert den Drag und den Release der Card
            //.animation(.bouncy, value: dragAmount)
    }
}

#Preview {
    AnimationGestureView()
}
