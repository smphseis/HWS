//
//  GroupIntroduction.swift
//  SnowSeeker
//
//  Created by Phil Seißelberg on 27.05.25.
//

import SwiftUI

//Group dient als leerer Container, der nur die Elemente und keine weiteren Infos zum Alignment enthält
//Alignment hängt von der ParentView ab
struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct GroupIntroduction: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var layoutVertically = false
    
    var body: some View {
        /*
        Button {
            layoutVertically.toggle()
        } label: {
            if layoutVertically {
                VStack {
                    UserView()
                }
            } else {
                HStack {
                    UserView()
                }
            }
         }
         */
        //Realierbar ist beispielsweise ein Wechsel aus der standardmäßigen Horizontalen Anordung in eine Vertikale, falls der Horizontale Platz begrenzt wird
        //Apple bietet hierfür Vertikale und Horizontale Größenklassen mit .compact- und .regular-Optionen
        if horizontalSizeClass == .compact {
            VStack {
                UserView()
            }
            //oder VStack(content: UserView.init)
        } else {
            HStack {
                UserView()
            }
            //oder HStack(content: UserView.init)
        }
    }
}

#Preview {
    GroupIntroduction()
}
