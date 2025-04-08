//
//  Contact.swift
//  ConferenceCards
//
//  Created by Phil Seißelberg on 23.10.24.
//

import Foundation
import SwiftData

@Model class Contact {
    @Attribute(.externalStorage) var photo: Data
    
    var name: String
    var phoneNumber: String
    var mail: String
    var address: String
    var social: String
    var notes: String
    
    init(photo: Data, name: String, phoneNumber: String, mail: String, address: String, social: String, notes: String) {
        self.photo = photo
        self.name = name
        self.phoneNumber = phoneNumber
        self.mail = mail
        self.address = address
        self.social = social
        self.notes = notes
    }
}

