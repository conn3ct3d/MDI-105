//
//  ContentView.swift
//  BookManager
//
//  Created by mbair on 10/18/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var books:[Book] = [
        Book(title:"Siddhartha", author:"Hermann Hesse", image:"siddhartha"),
        Book(title:"Prometheus Rising", author:"Robert Anton Wilson", image:"prometheus"),
        Book(title:"VALIS", author:"Philip K. Dick", image:"valis")
    ]
    
    
    
    
    var body: some View {
        
        NavigationStack{
            List(books, id:\.self.title) { book in
                NavigationLink(destination:DetailView()){
                HStack{
                    Image(book.image ?? "")
                        .resizable()
                        .frame(width:50, height:70)
                    VStack(alignment:.leading){
                        
                        Text(book.title)
                        Text(book.author)
                            .font(.system(size:12))
                            .foregroundColor(.secondary)
                    }
                }
                }
            }.navigationBarTitle("Book Manager")
        }
        
    }

}

#Preview {
    ContentView()
}
