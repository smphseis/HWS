//
//  SearchableIntroduction.swift
//  SnowSeeker
//
//  Created by Phil Seißelberg on 27.05.25.
//

import SwiftUI

struct SearchableIntroduction: View {
    
    @State private var searchText = ""
    let allNames = ["Steve", "Phil", "Carig", "Eddy", "Tim", "Joz"]
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            allNames
        } else {
            //.localizedStandardContains() ignoriert bsw. Groß- und Kleinschreibung und Akzente und ist daher ideal für die Suche mit UserInput
            allNames.filter { $0.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        //Erfordert NavigationStack, damit Search Field dargestellt werden kann
        NavigationStack {
            List(filteredNames, id: \.self) { name in
                Text(name)
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Searching")
        }
    }
}

#Preview {
    SearchableIntroduction()
}
