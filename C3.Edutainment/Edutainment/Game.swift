//
//  Game.swift
//  Edutainment
//
//  Created by Phil Seißelberg on 07.06.24.
//

import Foundation
import Observation
import SwiftUI

@Observable
class Game {
    var questions: [Question] = []
    var answers: [Bool?] = []
    var currentGameIndex = 0
    var isSet = false
    var gameOver = false
    
    var result: (Int,Int) {
        var correct = 0
        var total = 0
        for answer in answers {
            if let res = answer {
                total += 1
                if res {
                    correct += 1
                }
            }
        }
        
        return (correct,total)
    }
    
    func configureGame(questionAmount: Int, multiplicationTable: Int) {
        questions.removeAll()
        answers.removeAll()
        
        for _ in 0..<questionAmount {
            let question = Question(firstMultiplicant: multiplicationTable, secondMultiplicant: Int.random(in: 1...10))
            questions.append(question)
        }
        
        for _ in 0..<questionAmount {
            answers.append(nil)
        }
        
        currentGameIndex = 0
        isSet = true
        gameOver = false
    }
    
    func move(answer: Int) {
        if questions[currentGameIndex].result == answer {
            answers[currentGameIndex] = true
        } else {
            answers[currentGameIndex] = false
        }
        
        if currentGameIndex < questions.count - 1 {
            currentGameIndex += 1
        } else {
            gameOver = true
        }
    }
    
    func getColor(index: Int) -> Color {
        if self.answers[index] == nil {
            return Color.gray
        } else if self.answers[index] == true {
            return Color.green
        } else {
            return Color.red
        }
    }
}

extension Game {
    static var exampleGame: Game {
        let game = Game()
        
        game.configureGame(questionAmount: 10, multiplicationTable: 3)
        game.answers[0] = true
        game.answers[1] = false
        
        return game
    }
}
