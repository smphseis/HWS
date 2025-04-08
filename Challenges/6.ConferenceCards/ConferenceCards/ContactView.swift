//
//  ContactView.swift
//  ConferenceCards
//
//  Created by Phil Seißelberg on 24.10.24.
//

import SwiftUI

struct ContactView: View {

    var contact: Contact
    
    var displayableImage: Image? {
        if let uiImage = UIImage(data: contact.photo) {
            return Image(uiImage: uiImage)
        }
        
        return nil
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                Form {
                    VStack {
                        Group {
                            if displayableImage != nil {
                                displayableImage?
                                    .resizable()
                                    .scaledToFit()
                            } else {
                                ZStack {
                                    Color.gray
                                    Image(systemName: "person.crop.circle")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 50))
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .frame(height: 300)
                            }
                        }
                        Text(contact.name)
                            .font(.title)
                    }
                    Section {
                        PropertyRowView(propertyTitle: "Phone number", propertyValue: contact.phoneNumber)
                        PropertyRowView(propertyTitle: "Mail", propertyValue: contact.mail)
                        PropertyRowView(propertyTitle: "Social", propertyValue: contact.social)
                    }
                    Section {
                        PropertyRowView(propertyTitle: "Address", propertyValue: contact.address)
                    }
                    Section {
                        Text(contact.notes)
                    }
                }
            }
        }
    }
}

#Preview {
    ContactView(contact: Contact(photo: Data(), name: "Tim Cook", phoneNumber: "123456789", mail: "timcook.test@icloud.com", address: "One Apple Park Way\nCupertino\nCalifornia", social: "@tc", notes: "Apple CEO"))
}
