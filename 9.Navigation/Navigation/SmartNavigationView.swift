//
//  SmartNavigationView.swift
//  Navigation
//
//  Created by Phil Seißelberg on 16.06.24.
//

import SwiftUI

struct SmartNavigationView: View {
    
    //Problem:
    //  - Verwenden von NavigationStack { NavigationLink {} } erzeugt bereits die LinkView, obwohl noch gar nicht angeklickt
    //  - es reicht schon, dass Link zur DetailView angezeigt, um diese schon im Hintergrund zu erstellen
    //  - bei Liste mit vielen Links und aufwendigen DetailView muss viel mehr erzeugt werden als in Situation nötig
    //  - in dem Fall wird auch viel mehrfach erzeugt (zu jeder Row wird DetaiView 2 mal erstellt)
    
    //Lösung: Trenne Wert von Ziel
    //  - Somit kann Swift die Zielview erst dann laden wenn benötigt
    //  - verwende daher einfachen NavigationLink, um Apperance in der Liste zu definieren (1)
    //  - verwende .navigationDestination(...) um Ziel für einen übergeben Wert zu definieren (2)
    //  - .navigationDestination erfodert dabei, dass der übergebene Typ Hashable ist, damit identifizierbar
    // - man kann auch mehrere .navigationDestination für verschiedene Typen definieren
        
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                //1
                NavigationLink("Select \(i)", value: i)
            }//2
            .navigationDestination(for: Int.self) { selection in
                //DestinationView
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    SmartNavigationView()
}

struct DetailView: View {
    var number: Int

    var body: some View {
        Text("Detail View \(number)")
    }

    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}


//Weitere Infos
// - Hashable wird viel in Swift verwendet
// - viele Typen von Haus aus konform
// - Verwendet beispielsweise auch in Set - dort müssen alle enthaltenen Elemente konform sein
//      - sorgt dafür, dass Set schneller als Array
//      - bei Suche nach Objekt in Set muss nur Hash verglichen werden und nichte jede Property einzeln
