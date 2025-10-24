//
//  DetailView.swift
//  BookManager
//
//  Created by mbair on 10/18/25.
//

import SwiftUI

struct DetailView: View {
    @Binding var book: Book
    @State private var showEditSheet:Bool = false
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing:20){
                HStack{
                    Image(book.image ?? "placeholder-book-cover")
                        .resizable()
                        .scaledToFit()
                        .frame(width:100, height:100)
                        .padding(.vertical, 20)
                    VStack{
                        Text("\(book.title)")
                            .font(.system(size:36, weight:.bold, design:.serif))
                        Text("by \(book.author)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
                Text(book.description ?? "No description")
            }
            .padding(.horizontal)
        }
        // MODIFIERS MOVED TO BE INSIDE 'body' (applied to ScrollView)
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("Edit", action: {
            showEditSheet.toggle()
        }))
        .sheet(isPresented: $showEditSheet, content: {
            AddEditBookView(book: $book)
        })
    } // <-- 'body' properly closes here
} // <-- 'struct DetailView' closes here

//#Preview {
//    DetailView()
//}
