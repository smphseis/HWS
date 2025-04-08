//
//  ModifierView.swift
//  ViewsAndModifiers
//
//  Created by Phil Seißelberg on 30.05.24.
//

import SwiftUI

struct ModifierView: View {
    var body: some View {
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        .background(.red)
        .frame(width: 200, height: 200)
        
        /* type(of:) gibt in diesem Fall den Typ
        
         ModifiedContent<
             ModifiedContent<
                    Button<Text>,
                    _BackgroundStyleModifier<Color>
             >,
             _FrameLayout
         >
            
           im Format ModifiedContent<Betreffende View, Modifizierte Eigenschaft>
           zurück.
        */
    }
}

#Preview {
    ModifierView()
}
