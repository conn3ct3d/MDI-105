//
//  AddEditBookView.swift
//  BookManager
//
//  Created by Emiliano on 10/20/25.
//
import Foundation
import SwiftUI
import SwiftData

struct AddEditBookView: View {
    
    @StateObject private var viewModel: AddEditBookViewModel
    /*State private var workingBook: Book*/
    
    var onSave: () -> Void
    
    
    init(book: PersistentBook? = nil, modelContext: ModelContext, onSave: @escaping () -> Void) {
        _viewModel = StateObject(wrappedValue: AddEditBookViewModel(book:book, modelContext:modelContext))
        self.onSave = onSave
    }
    
    @Environment(\.dismiss) var dismiss

    private var navTitle: String {
        viewModel.navigationTitle
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
                        TextEditor(text: $viewModel.summary)
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
                        
                        onSave()
                        viewModel.Save()
                        dismiss()
                    }
                    .disabled(viewModel.isSaveButtonDisabled)
                }
            }
        }
    }
}
