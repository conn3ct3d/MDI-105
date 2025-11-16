//
//  AddEditBookView.swift
//  BookManager
//
//  Created by Emiliano on 10/20/25.
//
import Foundation
import SwiftUI

struct AddEditBookView: View {
    
    @StateObject private var viewModel: AddEditBookViewModel
    var book: PersistentBook
    /*State private var workingBook: Book*/
    
    var onSave: () -> Void
    
    
    init(book: PersistentBook? = nil, modelContext: ModelContext) {
        _viewModel = StateObject(wrappedValue: AddEditBookViewModel(book:book, modelContext:modelContext))
    }
    
    @Environment(\.dismiss) var dismiss

    private var navTitle: String {

        workingBook.title.isEmpty ? "New Book" : "Edit Book"
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
                        TextField("Title of the book", text: $viewModel.title)
                        TextField("Author", text: $viewModel.author)
                        TextEditor(text: $viewModel.description)
                            .frame(height: 100)
                        Picker("Genre", selection: $viewModel.genre) {
                            ForEach(Genre.allCases, id: \.self) { genre in
                                Text(genre.rawValue).tag(genre)
                            }
                        }
                    }
                    
                    Section(header: Text("Review")) {
                        TextEditor(text: $viewModel.review)
                            .frame(height: 100)
                        Picker("Reading status", selection: $viewModel.readingStatus) {
                            ForEach(ReadingStatus.allCases, id: \.self) { status in
                                Text(status.rawValue).tag(status)
                            }
                        }
                        Picker("Rating", selection: $viewModel.rating) {
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
                        
    
                        book.title = workingBook.title
                        book.author = workingBook.author
                        book.description = workingBook.description
                        book.genre = workingBook.genre
                        book.rating = workingBook.rating
                        book.review = workingBook.review
                        book.readingStatus = workingBook.readingStatus
                        

                        onSave()
                        viewModel.save()
                        dismiss()
                    }
                    .disabled(viewModel.title.isEmpty)
                }
            }
        }
    }
}

//#Preview {
//
//    AddEditBookView(book: .constant(Book(title: "Sample Title", author: "Sample Author", description: "", review: "", rating: 3, genre: .nonFiction, readingStatus: .reading)), onSave: {})
//}
