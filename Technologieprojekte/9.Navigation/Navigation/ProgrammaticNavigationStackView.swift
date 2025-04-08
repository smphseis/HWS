//
//  ProgrammaticNavigationStackView.swift
//  Navigation
//
//  Created by Phil Seißelberg on 16.06.24.
//

import SwiftUI

struct ProgrammaticNavigationStackView: View {
    
    //Path erlaubt einfachere Navigation durch Code
    //Objekt hinzufügen -> automatisch Navigation dorthin
    //Objekte werden entweder manuell oder durch Back-Button entfernt
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }
                
                Button("Show 64") {
                    path.append(64)
                }
                Button("Show 32 then 64") {
                    path = [32,64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                 Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavigationStackView()
}
