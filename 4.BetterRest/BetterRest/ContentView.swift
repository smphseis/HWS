//
//  ContentView.swift
//  BetterRest
//
//  Created by Phil Seißelberg on 30.05.24.
//

import CoreML
import SwiftUI


struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    //Wenn wakeUp Date.now als Standardwert hat wird dieser immer angezeigt -> Unpraktisch wenn Startwert für Wecker im Wheel aktuelles Datum ist -> viel scrollen zum wahrscheinlich benötigten Datum -> defaultWakeUpTime, welche den Startwert für den Wecker auf 7 Uhr Morgens Ortszeit setzt
    //Ohne static könnte defaultWakeTime der Variable wakeUp oben nicht zugewiesen werden, da zur Berechnung einer Propertiy eine andere Property verwendet werden würde -> Problematisch, da Swift vorab nicht die Reihenfolge kennt, in der Swift die Properties erzeugt -> mit static gehört dies zum struct und ist nicht von der Existenz anderer Properties abhängig
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                Section("Desired amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                Section("Daily coffe intake") {
                    //^[] und (inflected: true) ist eine spezialisierte Markdown-Form, welche automatisch
                    //die Ausgabe 1 cup, 2 cups, 3 cups vornimmt
                    Picker("^[\(coffeeAmount) cup](inflect: true)", selection: $coffeeAmount) {
                        ForEach(1...20, id: \.self) {
                            Text("\($0)")
                                .tag($0)
                        }
                    }
                }
                Text(calculateBedtime(), format: .dateTime.hour().minute())
                    .font(.largeTitle)
            }
            .navigationTitle("BetterRest")
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedtime() -> Date {
        do {
            //config ermöglicht weitere Einstellungsmöglichkeiten, die man in 1 von 1000 Fällen braucht :)
            let config = MLModelConfiguration()
            //Wird ein Model in XCode hinengezogen wird automatisch eine gleich benannte Klasse erstellt
            let model = try SleepCalculator(configuration: config)
            
            //nun Übergabe der eingegebenen Werte: sleepAmount und coffeeAmount schon vorhanden
            //wakeUp ist in Sekunden nach Miternacht angegeben, alos 8 Uhr Morgens = 8 * 60 * 60 = 28800 Sekunden
            //Umrechnen im Code, indem man Komponente aus Date ausliest und dann entsprechend multipliziert
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            //nun enthält prediction die benötigte Anzahl an Schlaf, allerdings in Sekunden und somit für Nutzer nicht aussagekräftig
            //Daher Wert Umrechnen zu der Uhrzeit, wann User ins Bett muss
            let sleepTime = wakeUp - prediction.actualSleep
            return sleepTime
            //ChallengeModification
            //alertTitle = "Your ideal bedtime is..."
            //alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calcuulating your bedtime."
            showingAlert = true
            return Date.now
        }
    }
}

#Preview {
    ContentView()
}
