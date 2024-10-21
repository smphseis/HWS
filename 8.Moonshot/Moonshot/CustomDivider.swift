//
//  CustomDivider.swift
//  Moonshot
//
//  Created by Phil Seißelberg on 21.04.24.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDivider()
}
