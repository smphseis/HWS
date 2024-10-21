//
//  ContentView.swift
//  UnitConverter
//
//  Created by Phil Seißelberg on 02.03.24.
//

import SwiftUI

struct MenuView: View {
    
    @State private var selectedTheme = Theme.temperature
    
    var body: some View {
        VStack {
            Picker("Select a system", selection: $selectedTheme) {
                ForEach(Theme.allCases) {
                    Image(systemName: "\($0.rawValue)")
                }
            }
            .pickerStyle(.segmented)
            Divider()
            ConverterView(theme: $selectedTheme)
            HStack {
                Spacer()
                Button("Quit") {
                    exit(0)
                }
            }
        }
        .padding()
    }
}
 
#Preview {
    MenuView()
}
