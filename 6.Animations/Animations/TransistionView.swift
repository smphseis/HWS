//
//  TransistionView.swift
//  Animations
//
//  Created by Phil Seißelberg on 04.06.24.
//

import SwiftUI

struct TransistionView: View {
    
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    //.transition(.scale)
                    //viele weitere Transistion-Arten, auch .asymmetric, welches eine Art beim Anzeigen und die andere beim Schließen anzeigt
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    TransistionView()
}
