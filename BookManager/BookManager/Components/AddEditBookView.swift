//
//  AddEditBookView.swift
//  BookManager
//
//  Created by Emiliano on 10/20/25.
//

import SwiftUI

struct AddEditBookView: View {
    @Binding var book: Book
    
    // A computed property for a clean navigation title (display only)
    private var navTitle: String {
        book.title.isEmpty ? "New Book" : "Edit Book"
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            .gray.opacity(0.1),
                            .gray.opacity(0.3)
                        ]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                // Form content
                Form {
                    Section(header: Text("Book Details")) {
                        TextField("Title of the book", text: $book.title)
                        TextField("Author", text: $book.author)
                        TextEditor(text: $book.description)
                            .frame(height: 100)
                        Picker("Genre", selection: $book.genre) {
                            ForEach(Genre.allCases, id: \.self) { genre in
                                Text(genre.rawValue).tag(genre)
                            }
                        }
                    }
                    
                    Section(header: Text("Review")) {
                        TextEditor(text: $book.review)
                            .frame(height: 100)
                        Picker("Reading status", selection: $book.readingStatus) {
                            ForEach(ReadingStatus.allCases, id: \.self) { status in
                                Text(status.rawValue).tag(status)
                            }
                        }
                        Picker("Rating", selection: $book.rating) {
                            ForEach(1...5, id: \.self) { i in
                                Text("\(i) star\(i == 1 ? "" : "s")").tag(i)
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle(navTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//#Preview {
//
//    AddEditBookView(book: .constant(Book(title: "Sample Title", author: "Sample Author", description: "", review: "", rating: 3, genre: .fiction, readingStatus: .completed)))
//}
