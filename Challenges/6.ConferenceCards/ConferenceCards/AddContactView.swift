//
//  AddContactView.swift
//  ConferenceCards
//
//  Created by Phil Seißelberg on 23.10.24.
//

import PhotosUI
import SwiftData
import SwiftUI

struct AddContactView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var data = Data()
    @State private var name = ""
    @State private var phoneNumber = ""
    @State private var mail = ""
    @State private var address = ""
    @State private var social = ""
    @State private var notes = ""
    
    
    @State private var pickedItem: PhotosPickerItem?
    @State private var displayableImage: Image?
    
    var validateInput: Bool {
        return name.isEmpty
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    if pickedItem == nil {
                        PhotosPicker("Select a contact photo", selection: $pickedItem, matching: .images)
                    } else {
                        displayableImage?
                            .resizable()
                            .scaledToFit()
                    }
                }
                .onChange(of: pickedItem) {
                    Task {
                        if let loadedImage = try? await pickedItem?.loadTransferable(type: Image.self) {
                            displayableImage = loadedImage
                        }
                        
                        if let loadedData = try? await pickedItem?.loadTransferable(type: Data.self) {
                            data = loadedData
                            print("Data Transfeerd")
                        }
                    }
                }
                Section {
                    TextField("Enter name", text: $name)
                    TextField("Enter phone number", text: $phoneNumber)
                    TextField("Enter mail", text: $mail)
                    TextField("Enter address", text: $mail)
                    TextField("Enter social", text: $social)
                    TextEditor(text: $notes)
                }
                Button("Add Contact", action: addContact)
                    .disabled(validateInput)
            }
        }
    }
    
    private func addContact() {
        let newContact = Contact(photo: data, name: name, phoneNumber: phoneNumber, mail: mail, address: address, social: social, notes: notes)
        print(newContact.photo)
        modelContext.insert(newContact)
        dismiss()
    }
}

#Preview {
    AddContactView()
}
