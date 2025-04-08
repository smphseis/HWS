//
//  ContentView.swift
//  Bookworm
//
//  Created by Phil Seißelberg on 30.09.24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]
    //Erweiterte Optionen
        // @Query(sort: \Book.title) var books: [Book]
        // @Query(sort: \Book.rating, order: .reverse) var books: [Book]
        
        //Sortieren+Filtern besser mit SortDescriptor:
        // @Query(sort: [SortDescriptor(\Book.title)]) var books: [Book]
        // @Query(sort: [SortDescriptor(\Book.title, order: .reverse)]) var books: [Book]
        //@Query(sort: [
        //  SortDescriptor(\Book.title),
        //  SortDescriptor(\Book.author)
        //]) var books: [Book]
    
    
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                                .foregroundStyle(book.rating == 1 ? .red : .black)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
