//
//  AddEditBookView.swift
//  BookManager
//
//  Created by mbair on 10/20/25.
//

import SwiftUI

struct AddEditBookView: View {
    @Binding var book:Book
    var body: some View {
        ZStack{
            LinearGradient(
                gradient:Gradient(
                    colors: [
                        .gray.opacity(0.1),
                        .gray.opacity(0.3)
                    ]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
            
            Form{
                Section(header:Text("Book Details")){
                    TextField("Title of the book", text: $book.title)
                    TextField("Author", text: $book.author)
                    TextEditor(text:$book.description)
                        .frame(height:100)
                }
                Section(header:Text("Review")){
                    Text(book.description)
                }
            }
        }
        Text(book.title)
    }
}

//#Preview {
//    AddEditBookView()
//}
