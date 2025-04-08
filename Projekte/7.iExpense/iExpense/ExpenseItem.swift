//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Phil Seißelberg on 06.04.24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    /* Identifiable
        - lange Hexadezimale Strings, beispielsweise 08B15DB4-2F02-4AB8-A965-67A9C90D8A44
        - Anforderung: 4 muss erste Nummer im 3.Block sein
        - Abgesehen von der 4 -> 31 Stellen, jede kann 16 verschiedene Werte annehmen
        - generiert man eine UUID jede Sekunde -> nach einer Milliarden Jahre erste Duplikatgefahr
    */
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
