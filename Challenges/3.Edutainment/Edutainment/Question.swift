//
//  Question.swift
//  Edutainment
//
//  Created by Phil Seißelberg on 06.06.24.
//

import Foundation
import SwiftUI

struct Question {
    var firstMultiplicant : Int
    var secondMultiplicant : Int
    
    var printQuestion: String {
        "\(firstMultiplicant) x \(secondMultiplicant)"
    }
    
    var result: Int {
        firstMultiplicant * secondMultiplicant
    }
}

extension Question {
    static let fiveExampleQuestions = [
        Question(firstMultiplicant: 5, secondMultiplicant: 9),
        Question(firstMultiplicant: 3, secondMultiplicant: 8),
        Question(firstMultiplicant: 2, secondMultiplicant: 7),
        Question(firstMultiplicant: 5, secondMultiplicant: 6),
        Question(firstMultiplicant: 1, secondMultiplicant: 5)
    ]
}
