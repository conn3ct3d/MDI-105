//
//  ContentView.swift
//  BookManager
//
//  Created by Emiliano on 10/18/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var books: [Book] = getBooks()
    @State var showAddSheet = false
    @State var newBook: Book = Book(title: "")
    
    var body: some View {
        
        NavigationStack {
            List($books, id: \.self.id) { $book in
                NavigationLink(destination: DetailView(book: $book)) {
                    BookListItem(book: book)
                }
            }
            .navigationTitle("Book Manager")
            .toolbar {
                Button("Add") {
                    newBook = Book(title: "")
                    showAddSheet.toggle()
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddEditBookView(book: $newBook, onSave:{
                    books.append(newBook)
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
