//
//  ReadingStatus.swift
//  BookManager
//
//  Created by Emiliano on 10/24/25.
//

enum ReadingStatus: String, CaseIterable, Codable {
    case planToRead = "Plan to Read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Read"
    case unknown = "Unknown"
}
