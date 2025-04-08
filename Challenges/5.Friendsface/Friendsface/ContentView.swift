//
//  ContentView.swift
//  Friendsface
//
//  Created by Phil Seißelberg on 01.10.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink {
                    DetailView(user: user, users: users)
                } label: {
                    HStack {
                        Image(systemName: "person.fill")
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.company)
                                .font(.subheadline)
                        }
                    }
                }
            }
            .task {
                if users.isEmpty {
                    await loadData()
                }
            }
            .navigationTitle("Friendsface")
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            users = (try! decoder.decode([User].self, from: data)).sorted { $0.name.components(separatedBy: " ")[1] < $1.name.components(separatedBy: " ")[1] }
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
