//
//  Book.swift
//  BookManager
//
//  Created by Emiliano on 10/18/25.
//
import Foundation
struct Book:Identifiable, Codable {
    var id = UUID()
    var title:String
    var author:String = ""
    var image:String = "book-cover-placeholder"
    var description:String = ""
    var rating:Int = 1
    var review: String = ""
    var readingStatus:ReadingStatus = .unknown
    var isFavorite:Bool = false
    var genre:Genre = .unknown
}
