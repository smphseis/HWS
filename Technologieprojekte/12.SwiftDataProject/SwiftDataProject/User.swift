//
//  User.swift
//  SwiftDataProject
//
//  Created by Phil Seißelberg on 04.10.24.
//

//Date ist Teil von Foundation, daher import nötig (import SwiftUI inkludiert auch das Foundation-Framework)
import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
