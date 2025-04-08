//
//  EnumStateView.swift
//  BucketList
//
//  Created by Phil Seißelberg on 21.10.24.
//

import SwiftUI

enum LoadState: CaseIterable {
    case loading, success, failed
}

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed.")
    }
}

struct EnumStateView: View {
    
    @State private var loadingState = LoadState.loading
    
    var body: some View {
        VStack {
            switch loadingState {
            case .loading:
                LoadingView()
            case .success:
                SuccessView()
            case .failed:
                FailedView()
            }
            
            Button("Switch State") {
                loadingState = LoadState.allCases.randomElement()!
            }
        }
    }
}

#Preview {
    EnumStateView()
}
