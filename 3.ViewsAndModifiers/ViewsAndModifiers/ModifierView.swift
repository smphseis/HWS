//
//  ModifierView.swift
//  ViewsAndModifiers
//
//  Created by Phil Seißelberg on 30.05.24.
//

import SwiftUI

struct ModifierView: View {
    var body: some View {
        
        //Funktion type(of:) gibt Datentyp aus. In dem Fall
        //ModifiedContent< 
        //    ModifiedContent< Button<Text>, _BackgroundStyleModifier<Color>>,
        //    _FrameLayout
        //>
        //Für jeden Modifier wird also eine ModifiedContent erstellt, welcher links die betreffende View und rechts die modifizierende Eigenschaft enthält. Bei mehreren Modifiern verschachteln sich diese ModifiedContents
        //Somit ist die Reihenfolge von Modifiern relevant
        //Das Rendern erfolgt natürlich nur einmal und nicht nach jedem Schritt
        Button("Hello, world!") {
            print(type(of: self.body))
        }
        .background(.red)
        .frame(width: 200, height: 200)
    }
}

#Preview {
    ModifierView()
}
