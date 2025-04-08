//
//  DirectoryWrite.swift
//  BucketList
//
//  Created by Phil Seißelberg on 21.10.24.
//

import SwiftUI

//Jede App bekommt festen Bereich, in welchem die Daten abgelegt werden können
//Bereich wird auch bei iCloud-Backups gesichert
//Pfad des Directory muss konkret ausgelesen werden -> Sandbox erschwert systematisches Ableiten
//Löschen der App führt zum Löschen des Directorys
//Speicherplatz des Bereichs ist reduziert durch physischen Speicherplatz
//Auslesen mit:
//              URL.documentsDirectory
//Lesevorgänge mit:
//              String(contentsOf:) und Data(contentsOf:)
//Schreibvorgänge mit:
//              write(to:)
//write(to:) erwartet 2 Parameter:
//-> URL: Zusammengesetzt aus documents directory URL und einem Filename
//-> Speicheroptionen, unter anderem .atomic (File wird erst angezeigt, wenn vollständig geladen) oder .completeFileProtection (nur lesbar, wenn iPhone entsperrt)

struct LoadView: View {
    var body: some View {
        Button("Read and Write") {
            let data = Data("Test Message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")

            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
