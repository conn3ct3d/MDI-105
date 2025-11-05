//
//  ContentView.swift
//  BookManager
//
//  Created by Emiliano on 10/18/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var books: [Book] = getBooks()

    
    var body: some View {
        TabView{
            BookListView(books: $books)
                .tabItem{
                    Label("Books", systemImage:"books.vertical.fill")
                }
            FavoritesView(books:$books)
                .tabItem{
                    Label("Favorites", systemImage:"star")
                }
            SettingsView()
                .tabItem
            {
                Label("Settings", systemImage:"gearshape.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}
