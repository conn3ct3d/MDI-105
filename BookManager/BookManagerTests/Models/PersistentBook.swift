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
        let actual = PersistentBook(bookTitle: bookTitle, status: status, author: author, isFavorite: isFavorite)
        
        // Assert
        #expect(actual.readingStatus == ReadingStatus.finished)
        #expect(actual.isFavorite == false)
    }
}
