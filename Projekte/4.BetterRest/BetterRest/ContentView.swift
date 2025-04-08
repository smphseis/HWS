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
    
    //Setzt Wecker standardmäßig auf 7 Uhr, als static definiert damit Property zur View gehört und nicht von anderen (erst bei der Erzeugung deklarierten) Properties abhängig ist
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
            let config = MLModelConfiguration()
            //Klasse SleepCalculator wurde automatisch mit der Übergabe des trainierten Modells an XCode erzeugt
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            return sleepTime
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
