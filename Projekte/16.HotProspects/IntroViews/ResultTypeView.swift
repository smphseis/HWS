//
//  ResultTypeView.swift
//  HotProspects
//
//  Created by Phil Seißelberg on 30.10.24.
//

import SwiftUI

struct ResultTypeView: View {
    
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        do {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            output = "Found \(readings.count) readings"
        } catch {
            print("Download error")
        }
    }
}

#Preview {
    ResultTypeView()
}
