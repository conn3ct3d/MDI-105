//
//  DetailView.swift
//  BookManager
//
//  Created by Emiliano on 10/18/25.
//

import SwiftUI

struct DetailView: View {
    @Binding var book: Book
    @State private var showEditSheet: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                                HStack(spacing: 15) {
                    Image(book.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 150)
                        .cornerRadius(10)
                        .shadow(radius: 4)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(book.title)
                            .font(.system(size: 28, weight: .bold, design: .serif))
                            .lineLimit(3)
                        
                        Text("by \(book.author)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 10)
                
                CustomCapsule(book.readingStatus.rawValue)

                Text("Description")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(book.description.isEmpty ? "No description provided." : book.description)
                    .font(.body)
                
                HStack {
                    CustomCapsule(book.genre.rawValue, color: .secondary.opacity(0.3))
                    CustomCapsule(book.readingStatus.rawValue)
                    Spacer()
                    FavoriteToggle(isFavorite: $book.isFavorite)
                }
                
                if (book.review != "" ||    book.rating != 0) {
                    Divider().padding(.vertical, 8)
                    
                    Text("Review")
                        .font(.title3.weight(.semibold))
                    
                    if(book.rating > 0) {
                        Text("Rating: \(book.rating) \(book.rating > 1 ? "stars" : "star")")
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.orange)
                    }
                    
                    Text(book.review != "" ? book.review : "Not reviewed yet")
                        .font(.body)
                        .foregroundColor(book.review.isEmpty ? .secondary : .primary)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Edit") {
                showEditSheet.toggle()
            }
        }
        .sheet(isPresented: $showEditSheet) {
            AddEditBookView(book: $book, onSave:    {
                
            })
        }
    }
}

