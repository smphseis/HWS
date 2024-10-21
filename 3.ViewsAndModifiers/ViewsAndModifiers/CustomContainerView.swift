//
//  CustomContainerView.swift
//  ViewsAndModifiers
//
//  Created by Phil Seißelberg on 30.05.24.
//

import SwiftUI

struct CustomContainerView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            //HStack { entfällt, da bei content @ViewBuilder verwendet
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            //}
        }
    }
}

#Preview {
    CustomContainerView()
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}
