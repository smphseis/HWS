//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Phil Seißelberg on 12.03.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Spain","UK","Ukraine","US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var questionCount = 1
    @State private var animationSpin = 0.0
    @State private var numberTapped = 0
    @State private var showGameOverAlert = false
    @State private var showWrongAnswerAlert = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(
                    stops: [
                        .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                        .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
                    ],
                    center: .top,
                    startRadius: 200,
                    endRadius: 400)
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Text("Guess the Flag")
                        .font(.largeTitle.weight(.bold))
                        .foregroundStyle(.white)
                    Spacer()
                    Spacer()
                    HStack {
                        Spacer()
                        Text("\(questionCount)/8")
                        Spacer()
                        Text("|")
                        Spacer()
                        Text("Score: \(score)")
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    .font(.title.bold())
                    Spacer()
                    VStack(spacing: 15) {
                        VStack {
                            Text("Tap the flag of")
                                .foregroundStyle(.secondary)
                                .font(.subheadline.weight(.heavy))
                            Text(countries[correctAnswer])
                                .foregroundStyle(.white)
                                .font(.largeTitle.weight(.semibold))
                        }
                        
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                                numberTapped = number
                                withAnimation {
                                    animationSpin += 360
                                    showingScore = false
                                }
                            } label: {
                                FlagView(country: countries[number])
                            }
                            .alert("Game Over", isPresented: $showGameOverAlert) {
                                Button("Continue", action: resetGame)
                            } message: {
                                Text("Your score is \(score)")
                            }
                            .alert("Wrong answer!", isPresented: $showWrongAnswerAlert) {
                                Button("OK") {
                                    showWrongAnswerAlert = false
                                }
                            } message: {
                                Text("\(countries[correctAnswer]) is the correct answer!")
                            }
                            .rotation3DEffect(.degrees(numberTapped == number ? animationSpin : 0), axis: (x: 0, y: 1, z: 0))
                            .opacity(self.showingScore && number != self.correctAnswer ? 0.25 : 1.0)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                }
                .padding()
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
        } else {
            if score > 0 {
                score -= 1
            } else {
                score = 0
            }
            showWrongAnswerAlert = true
        }
        
        if questionCount == 8 {
            showGameOverAlert = true
        } else {
            askQuestion()
        }
    }
    
    func askQuestion() {
        questionCount += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func resetGame() {
        questionCount = 0
        score = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
