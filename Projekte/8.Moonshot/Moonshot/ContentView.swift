//
//  ContentView.swift
//  Moonshot
//
//  Created by Phil Seißelberg on 11.04.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingGrid = true
    
    //Type muss explizit angegeben werden, da generisches load verwendet
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayoutView(astronauts: astronauts, missions: missions)
                } else {
                    ListLayoutView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("My Moonshot")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation {
                            showingGrid.toggle()
                        }
                    } label: {
                        if showingGrid {
                            Image(systemName: "list.dash")
                                .foregroundStyle(.white)
                        } else {
                            Image(systemName: "square.grid.3x3")
                                .foregroundStyle(.white)
                        }
                    
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
