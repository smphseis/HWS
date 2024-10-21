//
//  StepperIntroductionView.swift
//  BetterRest
//
//  Created by Phil Seißelberg on 30.05.24.
//

import SwiftUI

struct StepperIntroductionView: View {
    
    @State private var sleepAmount = 8.0
    
    var body: some View {
        /*
        Stepper("\(sleepAmount) hours", value: $sleepAmount)
         
        Ohne weitere Angabe geht Reichweite bis zum maximal Speicherbaren Wert des Datentyps (hier Double)
         
        Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 4...12)
         
        Des weiteren kann auch die Schrittweite eingestellt werden.
        Zusätzlich erfolgt in der nächsten Zeile eine Formatierung von 8,0000000 -> 8 oder 8,25 usw.
        */
        
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        
    }
}

#Preview {
    StepperIntroductionView()
}
