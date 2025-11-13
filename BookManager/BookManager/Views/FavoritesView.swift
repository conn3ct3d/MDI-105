//
//  FavoritesView.swift
//  BookManager
//
//  Created by mbair on 10/25/25.
//

import SwiftUI

struct FavoritesView: View {
    @Binding var books:[Book]
    @State private var showFilterSheet: Bool = false
    @State var selectedGenre: Genre?
    @State var selectedReadingStatus: ReadingStatus?
    
    @AppStorage(FAVORITE_GRID_COLUMN_NUMBER_KEY) private var numberOfColumns: Theme = DEFAULT_FAV_GRID_COLUMNS_NUMBER
    
    private var gridLayour: [GridItem]
    {
        Array(repeating: GridItem(.flexible()), count: numberOfColumns)
    }
    
    
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
                FilterButton(action:{showFilterSheet.toggle()
                })
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
