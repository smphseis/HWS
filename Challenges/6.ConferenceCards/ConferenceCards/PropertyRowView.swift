//
//  PropertyRowView.swift
//  ConferenceCards
//
//  Created by Phil Seißelberg on 26.10.24.
//

import SwiftUI

struct PropertyRowView: View {
    
    let propertyTitle: String
    let propertyValue: String
    
    var body: some View {
        if !propertyValue.isEmpty {
            HStack {
                Text(propertyTitle)
                    .foregroundStyle(.gray)
                Spacer()
                Text(propertyValue)
            }
        }
    }
}

#Preview {
    PropertyRowView(propertyTitle: "Phone Number", propertyValue: "1233445677")
}
