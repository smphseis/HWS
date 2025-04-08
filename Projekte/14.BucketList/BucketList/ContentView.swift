//
//  ContentView.swift
//  BucketList
//
//  Created by Phil Seißelberg on 21.10.24.
//

import MapKit
import SwiftUI

enum SelectedMapStyle: String, Identifiable, CaseIterable {
    case standard = "Standard"
    case hybrid = "Hybrid"
    case imagery = "Imagery"
    
    var id: String { self.rawValue }
}

struct ContentView: View {
    
    @State private var selectedMapStyle = SelectedMapStyle.standard
    @State private var viewModel = ViewModel()
    @State private var showingAlert: Bool = false
    
    var mapStyle: MapStyle {
        switch selectedMapStyle {
        case .standard:
            return MapStyle.standard
        case .hybrid:
            return MapStyle.hybrid
        case .imagery:
            return MapStyle.imagery
        }
    }
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51, longitude: 10),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isUnlocked {
                    NavigationStack {
                        MapReader { proxy in
                            Map(initialPosition: startPosition) {
                                ForEach(viewModel.locations) { location in
                                    Annotation(location.name, coordinate: location.coordinate) {
                                        Image(systemName: "star.circle")
                                            .resizable()
                                            .foregroundStyle(.red)
                                            .frame(width: 44, height: 44)
                                            .background(.white)
                                            .clipShape(Circle())
                                            .simultaneousGesture(
                                                LongPressGesture(
                                                    minimumDuration: 1
                                                ).onEnded { _ in viewModel.selectedPlace = location }
                                            )
                                    }
                                }
                            }
                            .sheet(item: $viewModel.selectedPlace) { place in
                                EditView(location: place) {
                                    viewModel.update(location: $0)
                                }
                            }
                            .mapStyle(mapStyle)
                            .onTapGesture { position in
                                if let coordinate = proxy.convert(position, from: .local) {
                                    viewModel.addLocation(at: coordinate)
                                }
                            }
                        }
                    }
                } else {
                    Group {
                        Button("Unlock Places") {
                            viewModel.authenticate()
                            if !viewModel.isUnlocked {
                                showingAlert = true
                            }
                        }
                        .padding()
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.capsule)
                    }
                    //.alert(isPresented: $showingAlert) {
                    //    Alert(
                    //        title: viewModel.alertTitle,
                    //        message: viewModel.alertMessage
                    //    )
                    //}
                }
            }
            .navigationTitle("BucketList")
            .toolbar {
                Picker("Map style", selection: $selectedMapStyle) {
                    Text(SelectedMapStyle.standard.rawValue).tag(SelectedMapStyle.standard)
                    Text(SelectedMapStyle.hybrid.rawValue).tag(SelectedMapStyle.hybrid)
                    Text(SelectedMapStyle.imagery.rawValue).tag(SelectedMapStyle.imagery)
                }
                .opacity(viewModel.isUnlocked ? 1 : 0)
                .disabled(!viewModel.isUnlocked)
            }
        }
    }
}

#Preview {
    ContentView()
}

//Notes
//Tap Gesture-Modifier:
//-> Klasssicher Button oder eingebaute Kontrollelemente sind grundsätzlich zu bevorzugen
//-> Einsatz von Tag Gesture kann zu Problemen mit Screen Readers führen
//-> hier benötigt, da zum setzen des Markers die exakte Screen-Postion des Taps ausgelesen werden muss

//.onTapGesture { position in
//print("Tapped at \(position)") //Beispielausgabe: Tapped at (276.3333282470703, 627.6666564941406)
//}

//Problem: Screen Coordinates müssen im Map Coordinates umgewandelt werden -> MapReader zum Konvertieren verwenden

