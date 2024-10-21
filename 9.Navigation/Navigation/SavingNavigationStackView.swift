//
//  SavingNavigationStackView.swift
//  Navigation
//
//  Created by Phil Seißelberg on 18.06.24.
//

import SwiftUI
import Observation

struct SavingNavigationStackView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SavingNavigationStackView()
}

//Manche Apps erfordern das Speichern des Pfads, somit kann View konfiguration auch bei Neustart geladen werden
//Verwende spezielle @Observable-Klasse, welche Änderungen trackt
//Klasse muss nach Definition wie folgt eingebunden werden:
//  - @State private var pathStore = PathStore()
//  - NavigationStack(path: $pathStore.path) 


@Observable
class PathStore {
    //speichert bei jeder Änderungen Daten ab
    var path: [Int] {
        didSet {
            save()
        }
    }
    
    //URL.documentsDirectory gibt URL des Speicherbereichs zurück, der App zugeordnet ist
    //Dieser Bereich ist nur für die App -> somit Kollisionsfrei mit anderen
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        //Gespeicherte JSON-Daten holen
        if let data = try? Data(contentsOf: savePath) {
            //Dekodieren
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                //zuweisen
                path = decoded
                return
            }
        }
        //wen hier -> bisher keine Daten vorhanden -> leeren Pfad zuweisen
        path = []
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}


//Leichte Abwandlung bei Verwendung von NavigationPath:
//- Typänderung von Array zum Path
//- spezielle Hilfsmethoden für NavigationPath, u.a. NavigationPath.CodableRepresentation.self
//- NavigationPath nimmt Hashable-Objekte -> somit nicht zwangsläufig Codable -> erweiterete Prüfung nötig
/*
@Observable
class PathStore {
    //speichert bei jeder Änderungen Daten ab
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    //URL.documentsDirectory gibt URL des Speicherbereichs zurück, der App zugeordnet ist
    //Dieser Bereich ist nur für die App -> somit Kollisionsfrei mit anderen
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        //Gespeicherte JSON-Daten holen
        if let data = try? Data(contentsOf: savePath) {
            //Dekodieren
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                //zuweisen
                path = NavigationPath(decoded)
                return
            }
        }
        //wen hier -> bisher keine Daten vorhanden -> leeren Pfad zuweisen
        path = NavigationPath()
    }
    
    func save() {
        
        //Problem: NavigationStack nimmt sämtliche Hashable-Typen annimmt
        //Swift kann daher nicht sicher sein, dass Typen zur Laufzeit Codable-konfrom sind
        
        //daher auf gut Glück versuchen, Codable Repräsentation zu erzeugen
        guard let representation = path.codable else { return }
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}
*/
