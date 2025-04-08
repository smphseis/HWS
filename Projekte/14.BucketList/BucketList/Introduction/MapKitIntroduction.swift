//
//  MapKitIntroduction.swift
//  BucketList
//
//  Created by Phil Seißelberg on 21.10.24.
//

import SwiftUI
import MapKit

struct MapKitIntroduction: View {
    
    //Startposition der Map
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            //Kartenumfang um gegebenen Punkt
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    var body: some View {
        //Map(position: $position)
        //    .clipShape(.rect(cornerRadius: 15))
        //    .onMapCameraChange(frequency: .continuous) { context in
        //            print(context.region)
        //    }
        
        VStack {
            //Map mit Markern
            //Map {
            //    ForEach(locations) { location in
            //        //Marker(location.name, coordinate: location.coordinate)
            //        //Detailiertere Marker:
            //        Annotation(location.name, coordinate: location.coordinate) {
            //            Text(location.name)
            //                .font(.headline)
            //                .padding()
            //                .background(.blue)
            //                .foregroundStyle(.white)
            //                .clipShape(.capsule)
            //        }
            //        .annotationTitles(.hidden)
            //    }
            //}
            //Screen to Map Reader (und vice versa)
            MapReader { proxy in
                Map()
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            print(coordinate)
                        }
                    }
            }
            HStack(spacing: 40) {
                Button {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                } label: {
                    ZStack {
                        Capsule()
                            .foregroundStyle(.orange.gradient)
                        Text("Paris")
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                }
                
                Button {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                } label: {
                    ZStack {
                        Capsule()
                            .foregroundStyle(.red.gradient)
                        Text("Tokio")
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                }
                
                Button {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
                label: {
                    ZStack {
                        Capsule()
                            .foregroundStyle(.blue.gradient)
                        Text("London")
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .frame(width: 100, height: 50)
                }
            }.padding()
        }
        
    }
}

#Preview {
    MapKitIntroduction()
}

//Mit gedrückter Option Taste können im Simulator Gesten mit 2 Fingern simuliert werden
//Map() ist typische Map View
//mit .mapStyle kann Kartentyp geändert werden, beispielsweise .mapStyle(.imagery)

//Konfigurierbar, wie Nutzer mit Karte interagieren kann, beispielsweise Rotation oder Zoom
//  Map(interactionModes: [.rotate, .zoom])     -> Map kann sowohl rangezoomt als auch rotiert werden
//  Map(interactionModes: [])                   -> Map bleibt fix


struct BasicLocation: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

let locations = [
    BasicLocation(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
    BasicLocation(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
]
