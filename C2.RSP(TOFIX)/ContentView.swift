//
//  ContentView.swift
//  RSP
//
//  Created by Phil Seißelberg on 12.03.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentAIChoice = "✌️"
    @State private var currentUserChoice = "✌️"
    @State private var shouldWin = false
    @State private var points = 0
    
    @State private var timeRemaining: TimeInterval = 60
    @State private var timer: Timer?
    @State private var isRunning = false
    @State private var buttonSymbol = "play.fill"
    @State private var showOptionWindow = false
    
    @State private var pointBoost = 0
    @State private var lastOptions = (0,0)
    
    let options = ["🪨","✌️","✋"]
    
    var body: some View {
        ZStack {
            VStack {
                Text("RSP")
                    .font(.system(size: 100))
                    .bold()
                    .foregroundStyle(.orange)
                HeaderView(aiSymbol: $currentAIChoice)
                Text(shouldWin ? "WIN" : "LOOSE")
                    .font(.system(size: 50))
                    .bold()
                    .foregroundStyle(.orange)
                HStack(spacing: 28) {
                    ForEach(["🪨","✌️","✋"], id: \.self) { symbol in
                        Button {
                            let correctMove = correctMove(aiMove: currentAIChoice, playerMove: currentUserChoice, shouldWin: shouldWin)
                            if correctMove {
                                pointBoost += 1
                                points += (2 * pointBoost)
                            } else {
                                pointBoost = 0
                            }
                            shuffle()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(.white)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(.orange, lineWidth: 5)
                                            .shadow(radius: 10)
                                    }
                                    .frame(width: 100, height: 100)
                                Text(symbol)
                                    .font(.system(size: 80))
                            }
                        }
                    }
                }
                .disabled(buttonSymbol == "play.fill")
                Spacer()
                HStack {
                    Spacer()
                    Text("\(points) pts.")
                        .foregroundStyle(.orange)
                        .font(.system(size: 20))
                        .bold()
                    Spacer()
                    Rectangle()
                        .foregroundStyle(.orange)
                        .frame(width: 5, height: 30)
                    Spacer()
                    Text(formattedTime())
                        .foregroundStyle(.orange)
                        .font(.system(size: 20))
                        .bold()
                    Spacer()
                    Rectangle()
                        .foregroundStyle(.orange)
                        .frame(width: 5, height: 30)
                    Spacer()
                    Button {
                        if buttonSymbol == "play.fill" {
                            if timeRemaining == 60 {
                                startTimer()
                            } else {
                                startTimer(timeRemaining)
                            }
                            buttonSymbol = "pause.fill"
                            showOptionWindow = false
                        } else {
                            stopTimer()
                            buttonSymbol = "play.fill"
                            showOptionWindow = true
                        }
                        
                    } label: {
                        Image(systemName: buttonSymbol)
                            .foregroundStyle(.orange)
                            .font(.system(size: 20))
                            .bold()
                    }
                    Spacer()
                }
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.orange, lineWidth: 5)
                }
                .padding()
            }
            if showOptionWindow {
                VStack {
                    Text("Game Paused")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundStyle(.orange)
                    Text("Current Score: \(points)")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundStyle(.orange)
                }
                .frame(width: 350, height: 600)
                .background(.thinMaterial)
            }
        }
    }
    
    private func formattedTime() -> String {
        let minutes = Int (timeRemaining) / 60
        let seconds = Int (timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func startTimer(_ restTime: TimeInterval = 60) {
        self.timeRemaining = restTime
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopTimer()
            }
        }
    }
    
    private func stopTimer() {
        isRunning = false
        timer?.invalidate()
    }
    
    private func shuffle() {
        var randomMove: Int = 0
        var randomPrompt: Int = 0
        while randomMove != lastOptions.0 {
            randomMove = Int.random(in: 0..<3)
        }
        currentAIChoice = options[randomMove]
        randomPrompt = Int.random(in: 0..<2)
        if randomPrompt == 0 {
            shouldWin = true
        } else {
            shouldWin = false
        }
    }
    
    private func correctMove(aiMove: String, playerMove: String, shouldWin: Bool) -> Bool {
        switch aiMove {
            case "🪨":
                switch shouldWin {
                    case true:
                        if playerMove == "✋" {
                            return true
                        } else {
                            return false
                        }
                    case false:
                        if playerMove != "✋" {
                            return true
                        } else {
                            return false
                        }
                }
            case "✌️":
                switch shouldWin {
                    case true:
                        if playerMove == "🪨" {
                            return true
                        } else {
                            return false
                        }
                    case false:
                        if playerMove != "🪨" {
                            return true
                        } else {
                            return false
                        }
                }
            case "✋":
                switch shouldWin {
                    case true:
                        if playerMove == "✌️" {
                            return true
                        } else {
                            return false
                        }
                    case false:
                    if playerMove != "✌️" {
                        return true
                    } else {
                        return false
                    }
                }
            default:
                return true
            }
    }
    
}

#Preview {
    ContentView()
}
