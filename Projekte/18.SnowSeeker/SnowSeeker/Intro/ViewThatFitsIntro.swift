//
//  ViewThatFitsIntro.swift
//  SnowSeeker
//
//  Created by Phil Seißelberg on 27.05.25.
//

import SwiftUI

struct ViewThatFitsIntro: View {
    var body: some View {
        VStack {
            //ViewThatFits probiert der Reihenfolge nach die gegebenen Views nach und prüft ob diese der Größe nach passen -> erstes darstellbares Element wird angezeigt (Circle)
            ViewThatFits {
                Rectangle()
                    .frame(width: 500, height: 200)
                Circle()
                    .frame(width: 200, height: 200)
            }
        }
        .frame(width: 220, height: 220)
    }
}

#Preview {
    ViewThatFitsIntro()
}
