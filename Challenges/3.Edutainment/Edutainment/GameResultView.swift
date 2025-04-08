//
//  GameResultView.swift
//  Edutainment
//
//  Created by Phil Seißelberg on 07.06.24.
//

import SwiftUI

struct GameResultView: View {
    
    @Environment(Game.self) private var game
    @Binding var gameState: GameState
    
    var body: some View {
        ZStack {
            Color(.first)
                .ignoresSafeArea()
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.second)
                VStack(alignment: .leading) {
                    Text("You got")
                    Text("\(game.result.0)/\(game.result.1)")
                    Text("questions")
                    Text("right")
                    if Double(game.result.0 / game.result.1) > 0.8 {
                        Text("Great work!")
                    }
                    Button {
                        gameState = .gameConfiguration
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.fourth)
                            Text("Play again")
                                .foregroundStyle(.first)
                                .font(.system(size: 25))
                                .bold()
                                
                        }
                        .frame(width: 180, height: 60)
                    }
                }
                .font(.system(size: 40))
                .bold()
                .foregroundStyle(.fourth)
            }
            .frame(width: 280, height: 380)
        }
    }
}

#Preview {
    GameResultView(gameState: .constant(GameState.gameResult))
        .environment(Game.exampleGame)
}
