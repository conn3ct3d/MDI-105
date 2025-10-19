//
//  DetailView.swift
//  BookManager
//
//  Created by mbair on 10/18/25.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing:20){
                HStack{
                    Image("book-cover-placeholder")
                        .resizable()
                        .frame(width:100, height:100)
                    VStack{
                        Text("Title")
                        Text("By \("author")")
                    }
                }
                Text("Description")
            }
        }
    }
}

//#Preview {
//    DetailView()
//}
