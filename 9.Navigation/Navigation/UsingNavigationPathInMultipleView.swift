//
//  UsingNavigationPathInMultipleView.swift
//  Navigation
//
//  Created by Phil Seißelberg on 18.06.24.
//

import SwiftUI


//Um von einer tieferen View wieder zurück zur ersten zu kommen(Beispiel Bestellungszusammenfassung -> Home Screen) kann man entweder:
    // bei einfachen Pfad (beispielsweise Int-Array) removeAll()-Aufrufen oder
    // bei NavigationPath-Objekt ein neues zuweisen, also path = NavigationPath()
//Vorher muss der Path aber auch von Subviews aus erreichbar sein, entweder durch:
    // Path in einer @Observable Class speichern
    // @Binding nutzen (wie hier in diesem Beispiel verwendet)


struct UsingNavigationPathInMultipleView: View {
    
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            DemoDetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DemoDetailView(number: i, path: $path)
                }
        }
    }
}

struct DemoDetailView: View {
    
    var number: Int
    @Binding var path: [Int]
    
    var body: some View {
        NavigationLink("Go to RandomNumber", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll()
                }
            }
    }
}


