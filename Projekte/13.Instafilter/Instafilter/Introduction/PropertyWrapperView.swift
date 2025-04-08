//
//  PropertyWrapperView.swift
//  Instafilter
//
//  Created by Phil Seißelberg on 09.10.24.
//

import SwiftUI

struct PropertyWrapperView: View {
    
    //@State speichert Wert in einem seperaten Struct -> State<Double>
    //Struct kann nicht ohne weiteres manipuliert werden -> Probleme mit beispielsweise Binding
    @State private var blurAmount = 0.0 {
        didSet {
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            
            //Binding kommuniziert "unvorhersagbar" mit Wrapper -> triggert didSet nicht direkt
            //daher muss .onChange verwendet werden
            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { oldValue, newValue in
                    print("Value was changed from \(oldValue) to \(newValue)")
                }
                //onChange-Modifier kann überall im Code plaziert werden
                //ebenfalls Variante ohne Parameter vorhanden (Variante nur mit newValue ist seit iOS 17 deprecated)
            
            //Direkte Veränderung des Wertes arbeitet mit nonmutating set-Methode des Wrappers -> didSet wird getriggert
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
        .padding()
    }
}
