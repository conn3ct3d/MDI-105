//
//  BookManagerApp.swift
//  BookManager
//
//  Created by Emiliano on 10/18/25.
//

import SwiftUI
import SwiftData

@main
struct BookManagerApp: App {
    let modelContainer: ModelContainer
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(modelContainer)
        }
    }
    
    init() {
        do {
            let isUITesting = CommandLine.arguments.contains("-UITesting")
            
            if isUITesting {
                let config = ModelConfiguration(isStoredInMemoryOnly: true)
                modelContainer = try ModelContainer(for: PersistentBook.self, configurations: config)
            } else {
                modelContainer = try ModelContainer(for: PersistentBook.self)
                
                let modelContext = modelContainer.mainContext
                var fetchDescriptor = FetchDescriptor<PersistentBook>()
                fetchDescriptor.fetchLimit = 1
                let count = try modelContext.fetchCount(fetchDescriptor)
                
                if count == 0 {
                    
                    let booksToSeed = [
                        
                        (title:"Siddhartha", author:"Hermann Hesse", image:"siddhartha", description:"A spiritual journey of self-discovery during the time of the Buddha.", rating: 5, isFavorite:true, genre: Genre.philosophy, status: ReadingStatus.unknown),
                        (title:"Prometheus Rising", author:"Robert Anton Wilson", image:"prometheus", description:"An exploration of human consciousness using the 'eight-circuit' model.", rating: 4, isFavorite:false, genre: .nonFiction, status: .unknown),
                        (title:"VALIS", author:"Philip K. Dick", image:"valis", description:"A Gnostic science fiction novel that questions reality and identity.", rating: 5, isFavorite:false, genre: .scienceFiction, status: .unknown),
                        (title:"Epistulae Morales ad Lucilium", author: "Lucius Annaeus Seneca", image:"lucilium", description:"Letters detailing Stoic philosophy and advice for a virtuous life.", rating: 5, isFavorite: true, genre: .philosophy, status: .unknown),
                        (title:"The Case Against Reality", author:"Donald Hoffman", image:"reality", description:"An argument that our perception of reality is an evolutionary interface, not objective truth.", rating: 4, isFavorite:false, genre: .nonFiction, status: .unknown),
                        (title:"The Cult of the Black Cube", author:"Arthur Moros", image:"saturn", description:"An exploration of the Saturnian current in occultism and its esoteric practices.", rating: 5, isFavorite:false, genre: .occult, status: .unknown),
                        (title:"Psycho-Cybernetics", author:"Maxwell Maltz", image:"psycho", description:"A classic self-help book that applies cybernetics—the science of control—to the human mind to improve self-image and achieve goals.", rating: 5, isFavorite:false, genre: .selfHelp, status: .unknown),
                        (title:"Not Always So", author:"Shunryu Suzuki", image:"not-always", description:"A collection of talks by Zen master Shunryu Suzuki, offering insights on Zen practice and everyday life.", rating: 5, isFavorite:false, genre: .philosophy, status: .unknown),
                        (title:"Man's Search for Meaning", author:"Viktor Frankl", image:"man", description:"A psychiatrist's account of his time in Nazi concentration camps and the development of logotherapy, his philosophy on finding meaning.", rating: 5, isFavorite:false, genre: .philosophy, status: .unknown)
                    ]
                    
                    for bookData in booksToSeed {
                        let uiImage = UIImage(named: bookData.image)
                        let imageData = uiImage?.jpegData(compressionQuality: 0.8)
                        
                        let persistentBook = PersistentBook(
                            bookTitle: bookData.title,
                            imageData: imageData,
                            author: bookData.author,
                            summary: bookData.description,
                            genre: bookData.genre,
                            rating: bookData.rating,
                            review: "",
                            readingStatus: bookData.status,
                            isFavorite: bookData.isFavorite
                        )
                        modelContext.insert(persistentBook)
                    }
                }
            }
        } catch {
            fatalError("Failed to load model container: \(error)")
        }
    }
}
