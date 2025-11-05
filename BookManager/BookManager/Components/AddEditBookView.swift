//
//  AddEditBookView.swift
//  BookManager
//
//  Created by Emiliano on 10/20/25.
//

import SwiftUI

struct AddEditBookView: View {
    @Binding var book: Book
    @State private var workingBook:Book
    
    var onSave: () -> Void
    
    init (book:Binding<Book>)
    {
        self._book = book
        sekf._workingBook = .init(initialValue: book.wrappedValue)
    }
    
    @Environment(\.dismiss) var dismiss
    
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
                        TextField("Title of the book", text: $workingBook.title)
                        TextField("Author", text: $workingBook.author)
                        TextEditor(text: $workingBook.description)
                            .frame(height: 100)
                        Picker("Genre", selection: $workingBook.genre) {
                            ForEach(Genre.allCases, id: \.self) { genre in
                                Text(genre.rawValue).tag(genre)
                            }
                        }
                    }
                    
                    Section(header: Text("Review")) {
                        TextEditor(text: $workingBook.review)
                            .frame(height: 100)
                        Picker("Reading status", selection: $workingBook.readingStatus) {
                            ForEach(ReadingStatus.allCases, id: \.self) { status in
                                Text(status.rawValue).tag(status)
                            }
                        }
                        Picker("Rating", selection: $workingBook.rating) {
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
            
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave()
                        dismiss()
                        book.title = workingBook.title
                        book.author = workingBook.author
                        book.description = workingBook.description
                        book.genre = workingBook.genre
                        book.rating = workingBook.rating
                        book.review = workingBook.review
                        book.readingStatus = workingBook.readingStatus
                    }
                    .disabled(workingBook.title.isEmpty)
                }
            }
            }
        }
    }

//#Preview {
//
//    AddEditBookView(book: .constant(Book(title: "Sample Title", author: "Sample Author", description: "", review: "", rating: 3, genre: .fiction, readingStatus: .completed)))
//}
