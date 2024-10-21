//
//  ContentView.swift
//  Edutainment
//
//  Created by Phil Seißelberg on 07.06.24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(Game.self) private var game
    @State private var gameState = GameState.gameConfiguration
    
    var body: some View {
        switch gameState {
        case .gameConfiguration:
            GameConfigurationView(gameState: $gameState)
                .environment(game)
        case .gameRunning:
            GameView(gameState: $gameState)
                .environment(game)
        case .gameResult:
            GameResultView(gameState: $gameState)
                .environment(game)
        }
    }
}

#Preview {
    ContentView()
        .environment(Game())
}
