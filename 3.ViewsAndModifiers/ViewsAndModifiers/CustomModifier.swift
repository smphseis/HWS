//
//  CustomModifier.swift
//  ViewsAndModifiers
//
//  Created by Phil Seißelberg on 30.05.24.
//

import Foundation
import SwiftUI

//Eigene kombinierte ViewModifier erstellen
//  1.struct erstellen, zum ViewModifier-Protokoll konform machen
//  2.Konformität erfordert eine body(content:)-Funktion, wobei content innerhalb der Funktion für die View steht
//  3.Danach folgen dann die gewünschten vordefinierten Modifier
//  4.Anwendung auf View dann über .modifier(strcutName())

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

struct ExampleView: View {
    var body: some View {
        Text("Hello World")
        //    .modifier(Title())
            .titleStyle()
    }
}

//Für eine simplere Verwendung Extension verwenden
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}


#Preview {
    ExampleView()
}

//Bei Verwendung von ViewModifier kann man auch Parameter verwenden:

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}
