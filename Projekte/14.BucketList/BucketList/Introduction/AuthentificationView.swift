//
//  AuthentificationView.swift
//  BucketList
//
//  Created by Phil Seißelberg on 22.10.24.
//

import LocalAuthentication
import SwiftUI

struct AuthentificationView: View {
    
    //FaceID muss erst unter Target -> Info -> Add Row -> FaceID... hinzugefügt werden
    //TouchID kann direkt im Code erlaubt werden
    
    //Code für Authentication basiert leider noch auf Objective-C API -> Unbequemere Nutzung in SwiftUI ,da beispielsweise SwiftUI Error nutzt, Objective-C API benötigt jedoch noch NSError
    
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            Spacer()
            if isUnlocked {
                Text("Unlocked")
                    .font(.system(size: 30))
                Image(systemName: "lock.open")
                    .font(.system(size: 30))
            } else {
                Text("Locked")
                    .font(.system(size: 30))
                Image(systemName: "lock.fill")
                    .symbolEffect(.bounce.down.byLayer, options: .nonRepeating)
                    .bold()
                    .font(.system(size: 30))
            }
            Spacer()
            Button("Unlock manualy") {
                authenticate()
            }
            .buttonStyle(.borderedProminent)
            Button("Lock") {
                isUnlocked = false
            }
            .buttonStyle(.bordered)
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        //LAContext-Instanz erzeugen, ermöglicht u.a. Abfrage des Biometrischen Status
        let context = LAContext()
        var error: NSError?
        
        //Prüfe, ob biometrische Überprüfung überhaupt möglich (iPod touch hat beispielsweise bio. Sensoren)
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { sucess, authenticationError in
                if sucess {
                    //Authentification erfolgreich durchlaufen
                    isUnlocked = true
                } else {
                    
                }
            }
        } else {
            
        }
    }
}

#Preview {
    AuthentificationView()
}
