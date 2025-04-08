//
//  Notes.swift
//  CupcakeCorner
//
//  Created by Phil Seißelberg on 20.06.24.
//

import Foundation
import SwiftUI

///URLSession

//Beispiel:
// - Typen für Antwort definieren
struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackID: Int
    var trackName: String
    var collectionName: String
}

struct ShowDataView: View {
    
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackID) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
    }
}
