//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Phil Seißelberg on 28.05.25.
//

import SwiftUI

@Observable
class Favorites {
    
    private var resorts: Set<String>
    private let key = "Favorites"
    
    init() {
        if let savedFavorites = UserDefaults.standard.array(forKey: "favorites") as? [String] {
            resorts = Set(savedFavorites)
        } else {
            resorts = []
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
    }
    
    func save() {
        UserDefaults.standard.set(Array(resorts), forKey: "favorites")
    }
}
