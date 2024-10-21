//
//  GameView.swift
//  Edutainment
//
//  Created by Phil Seißelberg on 07.06.24.
//

import SwiftUI

struct GameView: View {
    
    @Environment(Game.self) private var game
    @Binding var gameState: GameState
    
    @State private var answer = ""
    
    var body: some View {
        ZStack {
            Color(.first)
                .ignoresSafeArea()
            VStack {
                HStack {
                    ForEach(0..<game.answers.count, id: \.self) {
                        if $0 == 0 {
                            Rectangle()
                                .clipShape(
                                    .rect(
                                        topLeadingRadius: 20,
                                        bottomLeadingRadius: 20,
                                        bottomTrailingRadius: 0,
                                        topTrailingRadius: 0
                                    )
                                )
                                .foregroundStyle(game.getColor(index: $0))
                        } else if $0 == (game.questions.count - 1) {
                            Rectangle()
                                .clipShape(
                                    .rect(
                                        topLeadingRadius: 0,
                                        bottomLeadingRadius: 0,
                                        bottomTrailingRadius: 20,
                                        topTrailingRadius: 20
                                    )
                                )
                                .foregroundStyle(game.getColor(index: $0))
                            } else {
                                Rectangle()
                                    .foregroundStyle(game.getColor(index: $0))
                            }
                        }
                    }
                    .frame(height: 8)
                    Spacer()
                    VStack {
                        Text("What")
                            .foregroundStyle(.second.gradient)
                            .rotationEffect(.degrees(-15))
                        Text("is")
                            .foregroundStyle(.third.gradient)
                            .rotationEffect(.degrees(10))
                        Text(game.questions[game.currentGameIndex].printQuestion)
                            .foregroundStyle(.fourth.gradient)
                            .bold()
                            .rotationEffect(.degrees(-10))
                    }
                    .font(.system(size: 130))
                    .padding(.bottom)
                    Spacer()
                HStack(spacing: 40) {
                        Text(answer)
                            .foregroundStyle(.second)
                            .font(.system(size: 50))
                            .frame(width: 150, height: 50)
                            .padding()
                            .border(.second, width: 6)
                        Button {
                            if answer != "" {
                                answer.removeLast()
                            }
                        } label: {
                            Image(systemName: "delete.backward.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                                .foregroundStyle(.third)
                        }
                        .disabled(answer.count == 0)
                    }
                    Spacer()
                    HStack {
                        ForEach(0..<10, id: \.self) { i in
                            Button {
                                answer = "\(answer)\(i)"
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(i % 2 == 0 ? .second : .third)
                                    Text("\(i)")
                                        .foregroundStyle(.white)
                                        .font(.largeTitle)
                                }
                                .frame(height: 50)
                            }
                            .disabled(answer.count > 2)
                        }
                    }
                    Button {
                        if let number = Int(answer) {
                            game.move(answer: number)
                        }
                        answer = ""
                        
                        if game.gameOver {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                gameState = .gameResult
                            }
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(.fourth.gradient)
                            Text("Enter")
                                .foregroundStyle(.white)
                                .bold()
                                .font(.system(size: 30))
                        }
                        .frame(height: 50)
                    }
                    .disabled(Int(answer) == nil)
            }
            .padding()
        }
    }
}

#Preview {
    GameView(gameState: .constant(GameState.gameRunning))
        .environment(Game.exampleGame)
}
