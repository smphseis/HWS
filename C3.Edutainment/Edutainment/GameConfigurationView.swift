//
//  GameConfigurationView.swift
//  Edutainment
//
//  Created by Phil Seißelberg on 07.06.24.
//

import SwiftUI

struct GameConfigurationView: View {
    
    @Environment(Game.self) private var game
    @Binding var gameState: GameState
    
    @State private var selectedMultiplicationTable = 7
    @State private var selectedQuestionAmount = 5
    let selectableQuestionAmounts = [5,10,20]
    
    var body: some View {
        ZStack {
            Color(.first)
                .ignoresSafeArea()
            VStack {
                HeaderTextView()
                Spacer()
                VStack {
                    HStack {
                        Text("Select a table...")
                            .foregroundStyle(.fourth)
                        Spacer()
                    }
                    Picker("Select a table", selection: $selectedMultiplicationTable) {
                        ForEach(1..<13) {
                            Text("\($0)")
                        }
                    }
                    .colorMultiply(.third)
                    .pickerStyle(.segmented)
                }
                
                Spacer()
                VStack {
                    HStack {
                        Text("Select a question amount...")
                            .foregroundStyle(.fourth)
                        Spacer()
                    }
                    Picker("Select a question amount", selection: $selectedQuestionAmount) {
                        ForEach(selectableQuestionAmounts, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .colorMultiply(.third)
                .pickerStyle(.segmented)
                }
                Spacer()
                Button {
                    game.configureGame(questionAmount: selectedQuestionAmount, multiplicationTable: selectedMultiplicationTable + 1)
                    gameState = .gameRunning
                } label : {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.fourth)
                        Text("Start Game")
                            .foregroundStyle(.first)
                            .font(.system(size: 25))
                            .bold()
                            
                    }
                    .frame(width: 180, height: 60)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    GameConfigurationView(gameState: .constant(GameState.gameConfiguration))
        .environment(Game())
}
