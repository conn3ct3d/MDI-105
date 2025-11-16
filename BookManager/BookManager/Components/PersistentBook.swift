//
//  PersistentBook.swift
//  BookManager
//
//  Created by Emiliano on 11/15/25.
//

import Foundation
import SwiftData

@Model
class PersistentBook
{
    var title: String
    var author: String
    var imageData: Data?
    var summary: String
    var genre: Genre
    var rating: Int
    var review: String
    var readingStatus: ReadingStatus
    var isFavorite: Bool
    
    init
    (
        bookTitle:String,
        imageData: Data? = nil,
        author: String = "",
        summary: String = "",
        genre: Genre = .unknown,
        rating: Int = 0,
        review: String = "",
        readingStatus: ReadingStatus = ReadingStatus.unknown,
        isFavorite:Bool = false
    )
    {
        self.title = bookTitle
        self.imageData = imageData
        self.author = author
        self.summary = summary
        self.rating = rating
        self.review = review
        self.genre = genre
        self.isFavorite = isFavorite
        self.readingStatus = readingStatus
    }
    
    func getNameAndAuthor() -> String
    {
        if (self.author.isEmpty)
        {
            return "\(self.title) - \(self.author)"
        }
        return "\(self.title) by unknown author"
    }
}
