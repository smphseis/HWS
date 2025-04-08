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
         
        Ohne weitere Angabe geht Reichweite bis zum maximal speicherbaren Wert des Datentyps (hier Double)
         
        Stepper("\(sleepAmount) hours", value: $sleepAmount, in: 4...12)
         
        Des weiteren kann auch die Schrittweite + Formatierung
        */
        
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        
    }
}

#Preview {
    StepperIntroductionView()
}
