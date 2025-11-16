//
//  AddEditBookViewModel.swift
//  BookManager
//
//  Created by Emiliano on 11/16/25.
//

import Testing
import SwiftData
@testable import BookManager

@MainActor
struct AddEditViewModelTest
{
    @Test("ViewModel initializes correctly for a new book")
        func testNewBookInitialization() throws {
            // phase 1: Arrange
            let container = try ModelContainer(
                for: PersistentBook.self,
                configurations: .init(isStoredInMemoryOnly: true))
            let modelContext = container.mainContext
            
            // phase 2: Act
            let viewModel = AddEditViewModel(modelContext: modelContext)
            
            // phase 3: Assert
            #expect(viewModel.title == "")
            #expect(viewModel.author == "")
            // every other field assertions
            #expect(viewModel.navigationTitle == "Add Book")
            #expect(viewModel.isSaveButtonDisabled)
        }
        
        @Test("ViewModel initializes correctly for an existing book")
        func testExistingBookInitialization() throws {
            // phase 1: Arrange
            let container = try ModelContainer(
                for: PersistentBook.self,
                configurations: .init(isStoredInMemoryOnly: true))
            let modelContext = container.mainContext
            let book = PersistentBook(title: "Test Book", author: "Test Author", genre: .fantasy)
            
            // phase 2: Act
            let viewModel = AddEditViewModel(book: book, modelContext: modelContext)
            
            // phase 3: Assert
            #expect(viewModel.title == "Test Book")
            #expect(viewModel.author == "Test Author")
            // every other field assertions
            #expect(viewModel.navigationTitle == "Edit Book")
            #expect(viewModel.isSaveButtonDisabled)
            
            //Check small changes
            // Act 2
            viewModel.title = " \n"
            #expect(viewModel.isSaveButtonDisabled)
            // Assert2
            viewModel.title = "Test Book"
            #expect(viewModel.isSaveButtonDisabled)
            viewModel.title = "Test Book 2"
            #expect(!viewModel.isSaveButtonDisabled)
            
        }
        
        @Test("ViewModel creates a new book correctly")
        func testCreateNewBook() throws {
            
        }
        
        @Test("ViewModel updates an existing book correctly")
        func testUpdateExistingBook() throws {
            
        }
}
