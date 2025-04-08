//
//  ReviewView.swift
//  Instafilter
//
//  Created by Phil Seißelberg on 18.10.24.
//

import StoreKit
import SwiftUI

struct ReviewView: View {
    
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a review!") {
            //Funktion kann auch beliebig im Code nach irgenwelchen AKtionen platziert werden
            //Apple regelt sämtliche weitere Interaktionen und UI
            //Zeigt Menü beispielsweise nicht mehr an falls Review schon erfolgt
            requestReview()
        }
    }
}

#Preview {
    ReviewView()
}
