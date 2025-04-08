//
//  ContentView.swift
//  RSP
//
//  Created by Phil Seißelberg on 14.05.24.
//

import SwiftUI

enum Move: String, CaseIterable {
    case rock = "👊"
    case paper = "✌️"
    case scissor = "✋"
}


struct ContentView: View {
    
    let rspMoves = [Move.rock, Move.paper, Move.scissor]
    @State private var aiMove = Move.rock
    @State private var shouldWin = Bool.random()
    @State private var colorTheme = Color.orange
    @State private var showColorEditor = false
    @State private var questionCount = 0
    @State private var points = 0
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    ForEach(0..<10, id: \.self) { i in
                        Group {
                            if i == 0 {
                                UnevenRoundedRectangle(cornerRadii: .init(
                                    topLeading: 10,
                                    bottomLeading: 10
                                ))
                            } else if i == 9 {
                                UnevenRoundedRectangle(cornerRadii: .init(
                                    bottomTrailing: 10,
                                    topTrailing: 10
                                ))
                            } else {
                                Rectangle()
                            }
                        }
                        .foregroundStyle(i < questionCount ? colorTheme : .gray.opacity(0.1))
                    }
                }
                .frame(height: 15)
                .padding(.horizontal)
                Spacer()
                Text(aiMove.rawValue)
                    .font(.system(size: 90))
                Text("You should")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(colorTheme)
                Text(shouldWin ? "Win" : "Loose")
                    .font(.system(size: 90))
                    .bold()
                    .foregroundStyle(colorTheme)
                Spacer()
                HStack(spacing: 30) {
                    ForEach(rspMoves, id: \.self) { move in
                        Button {
                            makeMove(playersMove: move)
                        } label: {
                            ZStack {
                                Text(move.rawValue)
                                    .font(.largeTitle)
                                    .padding()
                            }
                            .containerRelativeFrame(.horizontal, alignment: .center) { length, axis in length * 0.25 }
                            .containerRelativeFrame(.vertical, alignment: .center) { length, axis in length * 0.12 }
                            .overlay { RoundedRectangle(cornerRadius: 15).stroke(colorTheme, lineWidth: 5) }
                        }
                    }
                }
                .padding()
                Spacer()
            }
            .padding()
            .sheet(isPresented: $showColorEditor) {
                NavigationView {
                    ColorPicker("Select a theme color", selection: $colorTheme)
                        .padding()
                }
                .presentationDetents([.medium, .large, .fraction(0.8), .height(100)])
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showColorEditor.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                    .foregroundStyle(colorTheme)
                }
            }
            .alert(
                Text("Game over!"),
                isPresented: $showAlert,
                actions: {
                    Button("New Game") {
                        questionCount = 0
                        points = 0
                        aiMove = rspMoves[Int.random(in: 0..<3)]
                        shouldWin = Bool.random()
                    }
                },
                message: {
                    Text("You have \(points)/10 correct answers.")
                }
            )
            Spacer()
        }
    }
    
    func makeMove(playersMove: Move) {
        let isValidMove = checkMove(playersMove: playersMove)
        questionCount += 1
        if isValidMove {
            points += 1
            aiMove = rspMoves[Int.random(in: 0..<3)]
            shouldWin = Bool.random()
        }
        if questionCount == 10 {
            showAlert = true
        }
    }
    
    func checkMove(playersMove: Move) -> Bool {
        if playersMove.rawValue == aiMove.rawValue {
            return false
        }
        
        switch playersMove {
        case .rock:
            if shouldWin {
                return aiMove.rawValue != Move.scissor.rawValue
            } else {
                return aiMove.rawValue != Move.paper.rawValue
            }
        case .paper:
            if shouldWin {
                return aiMove.rawValue != Move.rock.rawValue
            } else {
                return aiMove.rawValue != Move.scissor.rawValue
            }
        case .scissor:
            if shouldWin {
                return aiMove.rawValue != Move.paper.rawValue
            } else {
                return aiMove.rawValue != Move.rock.rawValue
            }
        }
    }
}

#Preview {
    ContentView()
}

