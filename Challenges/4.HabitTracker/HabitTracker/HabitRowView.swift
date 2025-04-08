//
//  HabitRowView.swift
//  HabitTracker
//
//  Created by Phil Seißelberg on 23.06.24.
//

import SwiftUI

struct HabitRowView: View {
    
    let title: String
    let description: String
    let count: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title)
                    .bold()
                Text(description)
                    .fontWeight(.light)
            }
            Spacer()
            Text("\(count)")
                .font(.system(size: 40))
                .bold()
            Image(systemName: "checkmark.circle")
                .font(.system(size: 30))
        }
    }
}

#Preview {
    NavigationStack {
        List {
            NavigationLink {
                
            } label: {
                HabitRowView(title: "Learn to code", description: "Fill the lines!", count: 23)
            }
        }
    }
}
