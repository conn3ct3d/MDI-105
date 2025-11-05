//
//  FavoritesView.swift
//  BookManager
//
//  Created by mbair on 10/25/25.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var books:[Book]
    @Binding var showFilterSheet:Bool = false
    @State var selectedGenre: Genre?
    @State var selectedReadingStatus: ReadingStatus?
    
    let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        
    ]
    
    
    // Computed var
    private var favoriteBooks:[Binding<Book>]{
        $books.filter
        {
            $0.wrappedValue.isFavorite
            &&  (
                selectedGenre == nil || $0.wrappedValue.genre == selectedGenre!
            )
            && (
                selectedReadingStatus == nil || $0.wrappedValue.readingStatus == selectedReadingStatus!
            )
        }
        
    }
    var body: some View {
        NavigationStack{
            if (selectedGenre != nil && selectedReadingStatus != nil){
                HStack
                {
                    if (selectedGenre != nil)
                    {
                        Text("genre: ")
                        CustomCapsule(selectedGenre!.rawValue)
                    }
                    if (selectedReadingStatus != nil)
                    {
                        Text("Status")
                        CustomCapsule(selectedReadingStatus!.rawValue)
                        
                    }
                }
                
                .padding()
            }
            if (favoriteBooks.isEmpty)
            {
                Spacer()
                VStack
                {
                    Image(systemName: "bookmark.fill")
                        .font(.largeTitle)
                        .foregroundColor(.secondary)
                    Text("No favorite books found")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            else{
                LazyVGrid(columns: gridLayout){
                    ForEach(favoriteBooks, id:\.id) { book in
                        NavigationLink(destination: DetailView(book: book)) {
                            BookCard(book: book)
                        }
                    }
                }.padding(.horizontal)
            }
        }.navigationTitle("My Favorite Books")
            .toolbar
        {
            ToolbarItem(placement:.topBarLeading)
            {
                Button(action:
                        {
                    showFilterSheet.toggle()
                }){
                    Image(systemName:line.horizontal.3.decrease.circle)
                }.accessibilityLabel("Open filter options")
            }
        }
        .sheet(isPresented: $showFilterSheet){
            // dismiss
        } content: {
            FiltersView(
                selectedGenre: $selectedGenre,
                selectedReadingStatus: $selectedReadingStatus
            )
        }
    }
}

//
