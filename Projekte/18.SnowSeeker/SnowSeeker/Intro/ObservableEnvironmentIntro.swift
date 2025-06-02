//
//  ObservableEnvironmentIntro.swift
//  SnowSeeker
//
//  Created by Phil Seißelberg on 27.05.25.
//

import Foundation
import Observation
import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    @Environment(Player.self) var player
    
    var body: some View {
        Text("Your high score: \(player.highScore)")
    }
}

struct ExampleView: View {
    @State var player = Player()
    
    var body: some View {
        //Anstatt
        //VStack {
        //    Text("Welcome!")
        //    HighScoreView(player: player)
        //}
        VStack {
            Text("Welcome!")
            HighScoreView()
        }
        .environment(player)
    }
}
