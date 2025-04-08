//
//  DetailView.swift
//  Friendsface
//
//  Created by Phil Seißelberg on 01.10.24.
//

import SwiftUI

struct DetailView: View {
    
    let user: User
    var users: [User]
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .fontWeight(.light)
                HStack {
                    Text(user.name)
                        .font(.title)
                        .bold()
                    Circle()
                        .fill(
                            user.isActive ?
                            Color.green.gradient :
                            Color.red.gradient
                        )
                        .shadow(radius: 1)
                        .frame(width: 15, height: 15)
                }
                Form {
                    FormEntryView(attribute: "Age", value: "\(user.age)")
                    FormEntryView(attribute: "Company", value: user.company)
                    FormEntryView(attribute: "Email", value: user.email)
                    FormEntryView(attribute: "Address", value: user.address)
                    FormEntryView(attribute: "About", value: user.about)
                    FormEntryDateView(attribute: "Date", value: user.registered)
                    FormEntryView(attribute: "Tags", value: user.tags.joined(separator: ", "))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 40) {
                            ForEach(user.friends) { friend in
                                if let user = users.first(where: { $0.id == friend.id  }) {
                                    NavigationLink {
                                        DetailView(user: user, users: users)
                                    } label: {
                                        VStack {
                                            Image(systemName: "person.circle")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 80)
                                            Text(friend.name)
                                        }
                                        .frame(width: 110)
                                    }
                                }
                            }
                        }
                        .frame(height: 110)
                    }
                }
            }
        }
    }
}

struct FormEntryView: View {
    
    var attribute: String
    var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(attribute)
                .font(.subheadline)
            Text(value)
                .font(.headline)
        }
    }
}

struct FormEntryDateView: View {
    
    var attribute: String
    var value: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(attribute)
                .font(.subheadline)
            Text(value, format: .dateTime)
                .font(.headline)
        }
    }
}

#Preview {
    DetailView(user: User.sampleUser, users: [User.sampleUser])
}
