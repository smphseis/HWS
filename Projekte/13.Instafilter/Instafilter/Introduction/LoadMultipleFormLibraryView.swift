//
//  LoadMultipleFormLibraryView.swift
//  Instafilter
//
//  Created by Phil Seißelberg on 18.10.24.
//

import PhotosUI
import SwiftUI

struct LoadMultipleFormLibraryView: View {
    //Referenz auf das ausgewählte Bild
    @State private var pickerItems = [PhotosPickerItem]()
    //AUsgewähltes Bild als Image
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<selectedImages.count, id: \.self) { i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
            PhotosPicker("Select images", selection: $pickerItems, matching: .images)
            
            //Optionaler Parameter maxSelectionCount, um maximale Anzahl der gleichzeitig auszuwählenden Bilder festzulegen
            //PhotosPicker("Select images", selection: $pickerItems, maxSelectionCount: 3, matching: .images)
            
            //Zusätzlich kann auch Bilderart gewählt werden (beispielsweise hier keine Screenshots)
            //PhotosPicker(selection: $pickerItems, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)])) {
               // Label("Select a picture", systemImage: "photo")
            //}
        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()

                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    LoadMultipleFormLibraryView()
}
