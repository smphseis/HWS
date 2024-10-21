//
//  CustomNavigationBarView.swift
//  Navigation
//
//  Created by Phil Seißelberg on 18.06.24.
//

import SwiftUI

struct CustomNavigationBarView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            //Einfärben der Toolbar, sobald man nach oben scrollt
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
            
            //toolbar kann auch versteckt werden - beispielsweise in bestimmten App-States
            //Navigation dann weiterhin möglich, jedoch kann es zu Problemen mit ScrollViews kommen
            //-> Inhalte scrollen beispielsweise unter Systemuhr
        }
    }
}

#Preview {
    CustomNavigationBarView()
}
