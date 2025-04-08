//
//  HeaderTextView.swift
//  Edutainment
//
//  Created by Phil Seißelberg on 09.06.24.
//

import SwiftUI

struct HeaderTextView: View {
    
    let text = ["E","d","u","t","a","i","n","m","e","n","t"]
    
    var body: some View {
        HStack {
            ForEach(0..<text.count, id: \.self) { i in
                Text("\(text[i])")
                    .foregroundStyle((i % 2 == 0) ? .fourth : .third)
                    .bold()
                    .font(.system(size: 45))
            }
        }
    }
}

#Preview {
    HeaderTextView()
}
