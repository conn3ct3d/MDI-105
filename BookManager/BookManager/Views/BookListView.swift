//
//  BookListView.swift
//  BookManager
//
//  Created by mbair on 10/25/25.
//

import SwiftUI

struct BookListView: View {
    
    @Binding var books: [Book]
    @State var showAddSheet = false
    @State var newBook: Book = Book(title: "")
    
    var body: some View {
        
        NavigationStack {
            List($books, id: \.self.id) { $book in
                NavigationLink(destination: DetailView(book: $book)) {
                    BookListItem(bookInList: book)
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

//#Preview {
//    BookListView()
//}
