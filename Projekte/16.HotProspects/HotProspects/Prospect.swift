//
//  Prospect.swift
//  HotProspects
//
//  Created by Phil Seißelberg on 10.11.24.
//

import Foundation
import SwiftData

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    var date: Date
    
    init(name: String, emailAddress: String, isContacted: Bool, date: Date = Date()) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
        self.date = date
    }
}
