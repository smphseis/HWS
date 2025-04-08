//
//  LoadFromLibraryView.swift
//  Instafilter
//
//  Created by Phil Seißelberg on 18.10.24.
//

import PhotosUI
import SwiftUI

struct LoadFromLibraryView: View {
    
    //Referenz auf das ausgewählte Bild
    @State private var pickerItem: PhotosPickerItem?
    //AUsgewähltes Bild als Image
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack {
            selectedImage?
                .resizable()
                .scaledToFit()
            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
        }
        .onChange(of: pickerItem) {
            Task {
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
    }
}

#Preview {
    LoadFromLibraryView()
}
