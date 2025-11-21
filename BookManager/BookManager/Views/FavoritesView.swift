//
//  FavoritesView.swift
//  BookManager
//
//  Created by mbair on 10/25/25.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
//    @Binding var books:[Book]
    @State private var showFilterSheet: Bool = false
    @State var selectedGenre: Genre?
    @State var selectedReadingStatus: ReadingStatus?
    
    @AppStorage(FAVORITE_GRID_COLUMN_NUMBER_KEY) private var numberOfColumns: Int = DEFAULT_FAV_GRID_COLUMNS_NUMBER
    
    @Query(filter: #Predicate<PersistentBook> { $0.isFavorite })
    private var favoriteBooksQuery: [PersistentBook]
    
    private var gridLayout: [GridItem]
    {
        Array(repeating: GridItem(.flexible()), count: numberOfColumns)
    }
    
    
    // Computed var
    private var filteredFavoriteBooks: [PersistentBook] {
        favoriteBooksQuery.filter { book in
            (selectedGenre == nil || book.genre == selectedGenre)
            &&
            (selectedReadingStatus == nil || book.readingStatus == selectedReadingStatus)
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
            if (filteredFavoriteBooks.isEmpty)
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
                ScrollView {
                    LazyVGrid(columns: gridLayout){
                        ForEach(filteredFavoriteBooks, id:\.id) { book in
                            NavigationLink(destination: DetailView(book: book)) {
                                BookCard(book: book)
                            }
                        }
                    }.padding(.horizontal)
                }
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
