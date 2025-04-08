//
//  ContactGridView.swift
//  ConferenceCards
//
//  Created by Phil Seißelberg on 23.10.24.
//

import SwiftUI

struct ContactGridView: View {
    
    let contact: Contact
    
    var displayableImage: Image? {
        if let uiImage = UIImage(data: contact.photo) {
            return Image(uiImage: uiImage)
        }
        
        return nil
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                ZStack {
                    if displayableImage != nil {
                        displayableImage?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Color.gray
                        Image(systemName: "person.crop.circle")
                            .foregroundStyle(.white)
                            .font(.system(size: 50))
                    }
                }
                ZStack {
                    Color.gray.opacity(0.2)
                    Text(contact.name)
                        .font(.headline)
                        .foregroundStyle(.white)
                }
                .frame(height: geo.size.height * 0.3)
            }
            .clipShape(RoundedRectangle(cornerRadius: 15))
        }
    }
}

#Preview {
    ContactGridView(contact: Contact(photo: Data(), name: "Tim Cook", phoneNumber: "123456789", mail: "timcook.test@icloud.com", address: "One Apple Park Way", social: "@tc", notes: "Apple CEO"))
}
