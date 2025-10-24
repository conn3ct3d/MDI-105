//
//  ContentView.swift
//  BookManager
//
//  Created by mbair on 10/18/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var books:[Book] = getBooks()
    
    var body: some View {
        
        NavigationStack{
            List($books, id:\.self.title) { $book in
                NavigationLink(destination:DetailView(book:$book)){
                    BookListItem(book:book)
                }
            }.navigationBarTitle("Book Manager")
        }
        
    }

}

#Preview {
    ContentView()
}
