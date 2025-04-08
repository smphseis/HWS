//
//  CustomObjectSort.swift
//  BucketList
//
//  Created by Phil Seißelberg on 21.10.24.
//

import Foundation

//struct User: Identifiable {
//    var id = UUID()
//    var firstName: String
//    var lastName: String
//}

//Sortieren über .sorted() auf Array mit Custom-Objekten nicht möglich

//sorted muss per Closure für Objekt angepasst werden
let usersSortedByClosure = [
    User(firstName: "Arnold", lastName: "Rimmer"),
    User(firstName: "Kristine", lastName: "Kochanski"),
    User(firstName: "David", lastName: "Lister"),
].sorted {
    $0.lastName < $1.lastName
}

//Comparable nutzen

struct User: Identifiable, Comparable {
    var id = UUID()
    var firstName: String
    var lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.firstName < rhs.firstName
    }
}


//Comparable mit < führt gleichzeitig Operator > ein (Invertiert Ergebnis von <)
