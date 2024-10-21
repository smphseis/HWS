//
//  Astronaut.swift
//  Moonshot
//
//  Created by Phil Seißelberg on 13.04.24.
//

import Foundation

struct Astronaut: Codable, Identifiable, Hashable {
    let id: String
    let name: String
    let description: String
}
