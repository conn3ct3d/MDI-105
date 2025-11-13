//
//  BookViewModel.swift
//  BookManager
//
//  Created by Emiliano on 11/10/25.
//

import Foundation

class BookViewModel: ObservableObject
{
    @Published var books: [Book] = []
    {
        // When something in books is about to change (add or delete) this
        // is triggered
        didSet
        {
            saveBooks()
        }
    }
    
    private let booksKey = BOOKS_KEY
    
    init()
    {
        loadBooks()
        if books.isEmpty
        {
            books = getBooks()
        }
    }
    
    func addBooks(_ book: Book)
    {
        books.append(book)
    }
    
    func deleteBook(at indexSet: IndexSet)
    {
        books.remove(atOffsets: indexSet)
    }
    
    func saveBooks()
    {
        if let enconded = try? JSONEncoder().encode(books)
        {
            UserDefaults.standard.set(encoded, forKey: booksKey)
        }
    }
    
    private func loadBooks()
    {
        if let savedBooksData = UserDefaults.standard.object(forKey: booksKey),
           let savedDecodedBooks = try? JSONDecoder().decode([Book].self, from: savedBooksData)
        {
            books = savedDecodedBooks
        }
    }
    
    
    
}
