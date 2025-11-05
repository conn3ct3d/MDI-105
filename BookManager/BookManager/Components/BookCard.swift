//
//  BookCard.swift
//  BookManager
//
//  Created by Emiliano on 10/25/25.
//

import SwiftUI

struct BookCard: View {
    @Binding var book:Book
    var body: some View {
        VStack{
            Text(book.title)
                .frame(maxWidth:.infinity)
                .font(.headline)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(
                    colors: [.clear,.black.opacity(0.8)],
                    startPoint:.bottom,
                    endPoint:.top
                ))
            Spacer()
            Text(book.author)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .font(.subheadline)
                .lineLimit(1)
                .padding(4)
                .background(LinearGradient(
                    colors:[.clear, .black.opacity(0.8)],
                    startPoint: .top,
                    endPoint: .bottom
                ))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(book.image)
                .resizable()
                .scaledToFill().opacity(0.9)
        )
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.5), radius:10, x:0, y:5)
        
    }
}

//#Preview {
//    BookCard()
//}
