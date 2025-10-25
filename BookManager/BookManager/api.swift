//
//  api.swift
//  BookManager
//
//  Created by mbair on 10/20/25.
//

func getBooks() -> [Book] {
    return [
        Book(title:"Siddhartha",
             author:"Hermann Hesse",
             image:"siddhartha",
             description:"A spiritual journey of self-discovery during the time of the Buddha.",
             rating: 5,
             isFavorite:true,
             genre: .philosophy
            ),

        Book(title:"Prometheus Rising",
             author:"Robert Anton Wilson",
             image:"prometheus",
             description:"An exploration of human consciousness using the 'eight-circuit' model.",
             rating: 4,
             genre: .nonFiction
            ),

        Book(title:"VALIS",
             author:"Philip K. Dick",
             image:"valis",
             description:"A Gnostic science fiction novel that questions reality and identity.",
             rating: 5,
             genre: .scienceFiction
            ),

        Book(title:"Epistulae Morales ad Lucilium",
             author: "Lucius Annaeus Seneca",
             image:"lucilium",
             description:"Letters detailing Stoic philosophy and advice for a virtuous life.",
             rating: 5,
             isFavorite: true,
             genre: .philosophy
            ),

        Book(title:"The Case Against Reality",
             author:"Donald Hoffman",
             image:"reality",
             description:"An argument that our perception of reality is an evolutionary interface, not objective truth.",
             rating: 4,
             genre: .nonFiction
            ),
        Book(title:"The Cult of the Black Cube",
             author:"Arthur Moros",
             image:"saturn",
             description:"An exploration of the Saturnian current in occultism and its esoteric practices.",
             rating: 5,
             genre: .occult
            ),
        Book(title:"Psycho-Cybernetics",
             author:"Maxwell Maltz",
             image:"psycho",
             description:"A classic self-help book that applies cybernetics—the science of control—to the human mind to improve self-image and achieve goals.",
             rating: 5,
             genre: .selfHelp
            ),
        Book(title:"Not Always So",
             author:"Shunryu Suzuki",
             image:"not-always", 
             description:"A collection of talks by Zen master Shunryu Suzuki, offering insights on Zen practice and everyday life.",
             rating: 5,
             genre: .philosophy
            ),
        Book(title:"Man's Search for Meaning",
             author:"Viktor Frankl",
             image:"man",
             description:"A psychiatrist's account of his time in Nazi concentration camps and the development of logotherapy, his philosophy on finding meaning.",
             rating: 5,
             genre: .philosophy
            ),
    ]
}
