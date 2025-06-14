//
//  Location.swift
//  BucketList
//
//  Created by Phil Seißelberg on 23.10.24.
//

import Foundation
import MapKit

//Codable, um Daten einfach zu Speichern und zu Laden
//Equatable, um einzelne Location der Collection besser finden zu können
//Einfache Koformität zu Equtable implementiert automatisch ==, indem alle Propertys miteinander verglichen werden
//effektiver, eigenes == zu schreiben, welches nur die UUID vergleicht -> spart Berechnungen
struct Location: Codable, Equatable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    #if DEBUG
        static let example = Location(id: UUID(), name: "Buckingham Palace", description: "Lit by over 40,000 lightbulbs.", latitude: 51.501, longitude: -0.141)
    #endif
}
