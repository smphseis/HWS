//
//  ActivityStore.swift
//  HabitTracker
//
//  Created by Phil Seißelberg on 22.06.24.
//

import Foundation
import Observation

@Observable
class ActivityStore {
    var activities = [Activity]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedActivities = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                activities = decodedActivities
                return
            }
        }
        
        activities = []
    }
}
