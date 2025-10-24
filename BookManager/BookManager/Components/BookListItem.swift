//
//  BookListItem.swift
//  BookManager
//
//  Created by mbair on 10/20/25.
//

import SwiftUI

struct BookListItem: View {
    let book:Book
    var body: some View {
        HStack{
            Image(book.image ?? "")
                .resizable()
                .frame(width:50, height:70)
            VStack(alignment:.leading){
                Text(book.title)
                Text(book.author ?? "Anonymous")
                    .font(.system(size:12))
                    .foregroundColor(.secondary)
            }
        }
    }
}

//#Preview {
//    BookListItem()
//}
