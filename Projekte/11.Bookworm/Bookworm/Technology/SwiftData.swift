//
//  SwiftData.swift
//  Bookworm
//
//  Created by Phil Seißelberg on 30.09.24.
//

import SwiftData
import SwiftUI


//SwiftData - Object Graph and Persistance Framework => Objekte und Properties definieren und persistent speichern
//Erlaubt zusätzlich, Daten zu Sortieren und zu Filtern, sowie Funktionen wie iCloud Sync, Lazy Load, Undo/Redo, ...

//Basiskonfiguration

    //1.Model definieren
        @Model //Implementiert auch Observable
        class Student {
            var id: UUID
            var name: String
            
            init(id: UUID, name: String) {
                self.id = id
                self.name = name
            }
        }

    //2.
        //Model Container anlegen
        //.modelContainer(for: Student.self)
        //Erzeugt Container beim ersten App-Start und lädt dann bei allen weiteren Starts die Daten von dort
        //Zusätzlich wird Model Context erstellt - "Live"-Version der Daten, welche Änderungen erst im Arbeitsspeicher ablegt und später auf die Fetsplatte schreibt
        //Ansatz ermöglicht schnelleres Arbeiten mit Daten

    //3.
        //Daten erhalten mit @Query
        //Ermöglicht Angabe, wie Daten zu Sortieren sind (+Filterung möglich)
        //@Query var students: [Student]

    //4.
        //Daten hinzufügen (und später auch löschen) durch Model Context
        //Kann über @Environment(\.modelContext) var modelContext erstellt werden
        //hinzufügen über .insert(...)
