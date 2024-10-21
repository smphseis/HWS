//
//  HeaderView.swift
//  RSP
//
//  Created by Phil Seißelberg on 12.03.24.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var aiSymbol: String
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                HStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                    Spacer()
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 150, height: 150)
                    Spacer()
                }
                .foregroundStyle(.orange)
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.white)
                            .overlay {
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(.orange, lineWidth: 5)
                                    .shadow(radius: 10)
                            }
                        .frame(width: 150, height: 150)
                        Text(aiSymbol)
                            .font(.system(size: 80))
                    }
                    Spacer()
                }
                .offset(y: -70)
            }
        }
    }
}

#Preview {
    HeaderView(aiSymbol: .constant("✌️"))
}
