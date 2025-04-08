//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Phil Seißelberg on 02.04.25.
//

import LocalAuthentication
import MapKit
import Observation

extension ContentView {
    @Observable
    class ViewModel {
        
        private(set) var locations: [Location]
        var selectedPlace: Location?
        var isUnlocked: Bool = true
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        var alertTitle: String = ""
        var alertMessage: String = ""
        
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
            
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace else { return }

            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
            
            save()
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                    if success {
                        self.isUnlocked = true
                    } else {
                        self.alertTitle = "Authentication failed"
                        self.alertMessage = "Please try again."
                    }
                }
            } else {
                self.alertTitle = "Authentication failed"
                self.alertMessage = "Your device does not support biometrics."
            }
        }
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
    }
}
