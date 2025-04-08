//
//  SamplePackageView.swift
//  HotProspects
//
//  Created by Phil Seißelberg on 10.11.24.
//

import SwiftUI
import SamplePackage

struct SamplePackageView: View {
    
    let possibleNumbers = 1...60
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    SamplePackageView()
}
