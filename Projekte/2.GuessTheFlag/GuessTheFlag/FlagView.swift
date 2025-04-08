//
//  FlagView.swift
//  GuessTheFlag
//
//  Created by Phil Seißelberg on 30.05.24.
//

import SwiftUI

struct FlagView: View {
    
    let country: String
    
    var body: some View {
        Image(country)
            .clipShape(.capsule)
            .shadow(radius: 5)
    }
}

#Preview {
    FlagView(country: "Germany")
}
