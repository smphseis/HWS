//
//  SmartNavigationView.swift
//  Navigation
//
//  Created by Phil Seißelberg on 16.06.24.
//

import SwiftUI

struct SmartNavigationView: View {
    
    //Problem:
    //  - Im NavigationStack werden die zu NavigationLink zugehörigen Views geladen, obwohl Link noch gar nicht angeklickt
    //  - bei Liste mit vielen Links und aufwendiger DetailView muss oft viel mehr erzeugt werden als nötig, teils auch mehrfach
    
    //Lösung: Trenne Wert und DetailView
    //  - Somit kann Swift die Zielview erst laden, wenn auch benötigt
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


//zu Hashable
// - Hashable wird viel in Swift verwendet
// - viele Typen direkt konform
// - wird beispielsweise auch in Set verwendet - dort müssen alle enthaltenen Elemente konform sein
// - sorgt dafür, dass Set schneller als Array, da bei Suche nach Objekt im Set nur Hash verglichen werden muss und nichte jede Property einzeln
