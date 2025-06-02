//
//  SplitViewIntroduction.swift
//  SnowSeeker
//
//  Created by Phil Seißelberg on 27.05.25.
//

import SwiftUI

struct SplitViewIntroduction: View {
    var body: some View {
        /*
        Darstellung hängt von Gerät und Orientierung ab:
         iPhone -> Primary
         iPad(Landscape) -> Primary in Sidebar, Content danaben
         iPad(Portrait) -> Content
        
        NavigationSplitView {
            Text("Primary")
        } detail: {
            Text("Content")
        }
         
         NavigationSplitView {
             NavigationLink("Primary") {
                 Text("New view")
             }
         } detail: {
             // Inhalt des NavigationLinks wird nach Antippen des Buttons im Detail angezeigt
             Text("Content")
         }
        */
        
        //Erzwinge Darstellung von Primary, selbst bei geringen Platz
        //columnVisibility erfordert Binding -> Speichern und dynamsches Anpassen
        NavigationSplitView(columnVisibility: .constant(.all)) {
            NavigationLink("Primary") {
                Text("New view")
            }
        } detail: {
            Text("Content")
                .navigationTitle("Content View")
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    SplitViewIntroduction()
}
