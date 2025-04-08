//
//  ShareLinkView.swift
//  Instafilter
//
//  Created by Phil Seißelberg on 18.10.24.
//

import SwiftUI

struct ShareLinkView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            ShareLink(item: URL(string: "https://www.hackingwithswift.com")!)
            Spacer()
            ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, subject: Text("Learn Swift here"), message: Text("Check out the 100 Days of SwiftUI!"))
            Spacer()
            ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
                Label("Spread the word about Swift", systemImage: "swift")
            }
            Spacer()
            let example = Image(.m4)

            ShareLink(item: example, preview: SharePreview("M4", image: example)) {
                Label("Click to share", systemImage: "cpu")
            }
            Spacer()
        }
    }
}

#Preview {
    ShareLinkView()
}
