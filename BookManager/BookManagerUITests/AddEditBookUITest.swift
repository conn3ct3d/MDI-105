import XCTest

class AddEditViewUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments.append("-UITesting")
        app.launch()
    }
    
    func testAddBookWorks() throws {
        
        let tablesQuery = app.tables
        let beforeAddingBookCount = tablesQuery.cells.count
        XCTAssertEqual(beforeAddingBookCount, 0)
        
        let addBookButton = app.buttons["Add"]
        addBookButton.tap()
        
        let newBookTitle = "New Test Book"
        let titleTextField = app.textFields["Title of the book"]
        
        XCTAssertTrue(!app.buttons["Save"].isEnabled)
        
        titleTextField.tap()
        titleTextField.typeText(newBookTitle)
        app.buttons["Save"].tap()
        
        let afterAddingBookCount = tablesQuery.cells.count
        XCTAssertEqual(afterAddingBookCount, (beforeAddingBookCount + 1))
        
        // Assert that the newly created book is visible
        let newBookCell = tablesQuery.cells.element(boundBy: beforeAddingBookCount)
        XCTAssertTrue(newBookCell.staticTexts[newBookTitle].exists)
    }
}
