//
//  ResortDetailView.swift
//  SnowSeeker
//
//  Created by Phil Seißelberg on 28.05.25.
//

import SwiftUI

struct ResortDetailView: View {
    
    let resort: Resort
    
    var size: String {
        switch resort.size  {
            case 1: "Small"
            case 2: "Average"
            default: "Large"
        }
    }
    
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    
    var body: some View {
        Group {
            VStack {
                Text("Size")
                    .font(.caption.bold())
                Text(size)
                    .font(.title3)
            }
            
            VStack {
                Text("Price")
                    .font(.caption.bold())
                Text(price)
                    .font(.title3)
            }
        }
        //Ermöglicht der Group, sich Horizontal nach Badarf auszubreiten
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ResortDetailView(resort: .example)
}
