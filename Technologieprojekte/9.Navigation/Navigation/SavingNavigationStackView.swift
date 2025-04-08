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
//Verwende @Observable-konforme Klasse, welche Änderungen trackt
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
    //Dieser Bereich ist nur für die App reserviert -> somit Kollisionsfrei mit anderen
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded
                return
            }
        }
        //leerer Pfad, falls keine Daten
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
