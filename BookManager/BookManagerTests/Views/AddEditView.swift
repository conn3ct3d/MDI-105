//
//  AddEditView.swift
//  BookManager
//
//  Created by Emiliano on 11/15/25.
//

import Testing
import SwiftUI
@testable import BookManager

@MainActor @Suite("Favorite View Tests")
struct FavoritViewTests
{
    // Testing filter favorite books function
    
    @Test("Should return an array of books containing only one element, When called with an array of three books, Having the array with only one book with favorite property set to true")
    func TestFilterFunctionWorksCorrectly()
    {
        // Arrange
        let arrayOfBooks = Binding.constant([
            Book(title:"Book1", isFavorite:true),
            Book(title:"Book2", isFavorite:true),
            Book(title:"Book3", isFavorite:false),
        ])
        
        // Act
        let actual = filterFavoriteBooks(
            books: arrayOfBooks,
            selectedGenre: nil,
            selectedStatus: nil
        )
        
        // Assert
        #expect(actual.count == 1)
        #expect(actual[0].wrappedValue.title == "Book1")
    }
}
