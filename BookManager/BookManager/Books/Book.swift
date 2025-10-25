//
//  Book.swift
//  BookManager
//
//  Created by mbair on 10/18/25.
//
import Foundation
struct Book:Identifiable {
    let id = UUID()
    var title:String
    var author:String = ""
    var image:String = "book-cover-placeholder"
    var description:String = ""
    var rating:Int = 0
    var review: String = ""
    var isFavorite:Bool = false
    var readingStatus:ReadingStatus = .unknown
}
