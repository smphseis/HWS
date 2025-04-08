//
//  DatePickerIntroductionView.swift
//  BetterRest
//
//  Created by Phil Seißelberg on 30.05.24.
//

import SwiftUI

struct DatePickerIntroductionView: View {
    
    @State private var wakeUp = Date.now
    
    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .date)
            .labelsHidden()
        //einfach "" schreiben ist nicht sinnvoll, da dennoch Platz reserviert wird und zudem die VoiceOver-Funktion erschwert wird -> .labelsHidden() verwenden
        //mit In-Parameter kann Range des auswählbaren Datums eingegrenzt werden
        //displayedComponents: .date oder .hourAndMinute oder weglassen => Day, Hour & Minute
    }
}

/* Weitere Notizen zu Date
 
 Range erstellen
 
 let now = Date.now
 let tomorrow = Date.now.addingTimeInterval(86400)   (86400 = Angabe Tag in Sekunden)
 let range = now...tomorrow
 
 
 
 Date von einzelnen Komponenten erstellen
 
 var components = DateComponents()
 components.hour = 8
 components.minute = 0
 let date = Calendar.current.date(from: components) //date(from:) gibt Optional zurück, daher
 let date = Calendar.current.date(from: components) ?? .now
 
 
 
 Umgekehrt: Daten auslesen
 
 let components = Calendar.current.dateComponents([.hour, .minute], from: someDate)
 let hour = components.hour ?? 0
 let minute = components.minute ?? 0
 
 
 
 Datum in Text-View formatieren
 
 Text(Date.now, format: .dateTime.hour().minute())
 Text(Date.now, format: .dateTime.day().month().year())
 Reihenfolge der Darstellung hängt dennoch von User Settings(-> Location) ab
 Alternativ können aber auch vordefinierte Formate ausgewählt werden
 Text(Date.now.formatted(date: .long, time: .shortened))
*/

#Preview {
    DatePickerIntroductionView()
}
