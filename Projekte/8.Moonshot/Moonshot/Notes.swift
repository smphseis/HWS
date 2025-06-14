//
//  Notes.swift
//  Moonshot
//
//  Created by Phil Seißelberg on 16.06.24.
//

import Foundation
import SwiftUI

///Image Resizing
// - Bild wird standardmäßig in tatsächlicher Größe angegeben -> resizable()-Modifier
// - meist verwendet in Kombination mit
//      .scaledToFit()      packe Bild größtmöglich komplett in View (ggf. wird nicht die ganze View ausgefüllt)
//      .scaledToFill()     View wird komplett ausgefüllt (ggf. werden Teile des Bildes abgeschnitten)
// - weitere Möglichkeit: .containerRelativeFrame
/*   Beispiel-Code
     Image(.example)
        .resizable()
        .scaledToFit()
        .containerRelativeFrame(.horizontal) { size, axis in
            size * 0.8 //gebe Größe zurück (hier also 80% der Elternview)
        }
*/

///Scroll View Area
struct ScrollViewExample: View {
    var body: some View {
        ScrollView(.horizontal) {
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                        .font(.title)
                }
            }
            //Erweitere scrollbareb Bereich über die ganze Breite
            .frame(maxWidth: .infinity)
        }
    }
}
#Preview("ScrollViewExample") {
    ScrollViewExample()
}

///NavigationStack
// - erlaubt Konfiguration der NavigationView
// - erlaubt zudem das Pushen neuer Views auf einen Stack
// - zum Pushen auf dem Stack werden NavigationLinks verwendet
// - NavigationLink wird verwendet um Details anzuzeigen bzw. tiefer in die Hierachie zu gehen

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct CodableExampleView: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """

            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

///Lazy Grids
// - Rows/Columns definieren, beispielsweise
// let layout = Array(repeating: GridItem(.fixed(80)), count: 3)
// Weitere Grid-Möglichkeiten:
//  - .adaptive(minimum: 80)
//  - .adaptive(minimum: 80, maximum: 120)
struct ExampleGridView: View {
    
    let layout = Array(repeating: GridItem(.fixed(80)), count: 3)
    
    var body: some View {
        ScrollView {
            //LazyHGrid verwendet einen Parameter row anstatt columns und zudem ScrollView(.horizontal)
            LazyVGrid(columns: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}
#Preview("ExampleGridView") {
    ExampleGridView()
}
