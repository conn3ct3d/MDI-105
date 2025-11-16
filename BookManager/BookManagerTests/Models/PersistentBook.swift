//
//  PersistentBook.swift
//  BookManager
//
//  Created by Emiliano on 11/15/25.
//

import Testing
@testable import BookManager
@MainActor @Suite("Model -- Persistent Book Tests")
struct PersistentBookTests
{
    @Test("Should create an instance of persistent book, when initialized with valid parameters")
    func TestPersistentBookInitializer()
    {
        // Arrange
        let bookTitle = "Test Title"
        let status = ReadingStatus.finished
        let author = "Test Author"
        let isFavorite = false
        
        // Act
        let actual = PersistentBook(bookTitle: bookTitle, author: author, readingStatus: status, isFavorite: isFavorite)
        
        // Assert
        #expect(actual.readingStatus == ReadingStatus.finished)
        #expect(actual.isFavorite == false)
    }
    
    @Test("Should set title and assign appropriate default properties when not provided. These properties can be then updated")
    func TestPersistentBookDefaultInitializer()
    {
        // Arrange
        let bookTitle = "Test Title"
        let status = ReadingStatus.reading
        let author = "Test Author"
        let isFavorite = true
        
        // Act
        let book = PersistentBook(bookTitle: bookTitle)
        
        // Assert
        #expect(book.title == bookTitle)
        #expect(book.readingStatus == .unknown)
        #expect(book.author == "")
        #expect(book.isFavorite == false)
        #expect(book.getNameAndAuthor() == "Test Title by Unknown Author")
        
        /// Second cycle
        
        // Act II
        book.readingStatus = status
        book.author = author
        book.isFavorite = isFavorite
        
        #expect(book.readingStatus == .reading)
        #expect(book.author == "Test Author")
        #expect(book.isFavorite == true)
        #expect(book.getNameAndAuthor() == "Test Title by Test Author")
        
    }
}
