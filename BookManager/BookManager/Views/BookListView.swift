//
//  BookListView.swift
//  BookManager
//
//  Created by mbair on 10/25/25.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    
    @Environment(\.modelContext) private var modelContext
    
//    @Binding var books: [Book]
    
    @Query var books: [PersistentBook]
    @State var showAddSheet = false
    
    @State var showFilterSheet: Bool = false
    @State var selectedGenre: Genre?
    @State var selectedReadingStatus: ReadingStatus?
    
    // Computed variable
    private var filteredBooks: [PersistentBook]
    {
        books.filter
        {
            (selectedGenre == nil || $0.genre == selectedGenre)
            &&
            (selectedReadingStatus == nil || $0.readingStatus == selectedReadingStatus)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                if filteredBooks.isEmpty{
                    Text("No books found.")
                        .font(.headline)
                }
            
            List(filteredBooks) { book in
                NavigationLink(destination: DetailView(book: book)) {
                    BookListItem(book: book)
                    }
                }
            }
            .navigationTitle("Book Manager")
            .toolbar {
                Button("Add") {
                    showAddSheet.toggle()
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddEditBookView(modelContext: modelContext, onSave:{
                    
                })
            }
        }
    }
}

//#Preview {
//    BookListView()
//}
