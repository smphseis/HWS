//
//  Activity.swift
//  HabitTracker
//
//  Created by Phil Seißelberg on 22.06.24.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id: UUID
    var title: String
    var description: String
    var completed: [Date]
}
