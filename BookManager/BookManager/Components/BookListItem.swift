//
//  BookListItem.swift
//  BookManager
//
//  Created by Emiliano on 10/20/25.
//

import SwiftUI

struct BookListItem: View {
    let book: PersistentBook
    
    var body: some View {
        HStack(spacing: 15) {
            Image(uiImage: (book.imageData != nil ? UIImage(data: book.imageData) : UIImage(resource: .defaultBook))!)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 70)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(book.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(book.author)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .padding(.vertical, 4) 
    }
}
//#Preview {
//    BookListItem()
//}
