//
//  AddBookView.swift
//  Bookworm
//
//  Created by Phil Seißelberg on 01.10.24.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var validInput: Bool {
        return title.isEmpty || author.isEmpty || genre.isEmpty || review.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    //Problem -> Tipp auf Row -> alle Buttons werden geklickt -> mit buttonStyle disabeln
                    RatingView(rating: $rating)
                        .buttonStyle(.plain)
                }
                
                Section {
                    Button("Save") {
                        let book = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(book)
                        dismiss()
                    }
                    .disabled(validInput)
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
