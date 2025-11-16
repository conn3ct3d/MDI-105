//
//  ContentView.swift
//  BookManager
//
//  Created by Emiliano on 10/18/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @AppStorage(SETTINGS_THEME_KEY) var theme: Theme = DEFAULT_SETTINGS_THEME
    
    @StateObject var bookViewModel: BookViewModel = BookViewModel()
    
//    @State var books = getBooks()
    
    
    var colorScheme: ColorScheme?
    {
        switch(theme)
        {
        case .light:
            return ColorScheme.light
        case .dark:
            return ColorScheme.dark
        case .system:
            return nil
        }
    }
    
    var body: some View {
        TabView{
            BookListView()
                .tabItem{
                    Label("Books", systemImage:"books.vertical.fill")
                }
            FavoritesView()
                .tabItem{
                    Label("Favorites", systemImage:"star")
                }
            SettingsView()
                .tabItem
            {
                Label("Settings", systemImage:"gearshape.fill")
            }
        }
        .preferredColorScheme(ColorScheme.dark)
    }
}

#Preview {
    ContentView()
}
