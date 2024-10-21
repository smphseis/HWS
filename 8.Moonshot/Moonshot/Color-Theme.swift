//
//  Color-Theme.swift
//  Moonshot
//
//  Created by Phil Seißelberg on 21.04.24.
//

import SwiftUI

//2 Möglichkeiten, Farben einzubringen:
//  -> über den Asset-Catalog
//  -> als Extension (Vorteil: bessere Arbeit in Gruppen, beispielsweise GitHub könnte Änderungen im Assets schlechter darstellen)

extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }

    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
