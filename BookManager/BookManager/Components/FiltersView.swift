//
//  FiltersView.swift
//  BookManager
//
//  Created by Emiliano on 11/3/25.
//

import SwiftUI

struct FiltersView: View {
    @Binding var selectedGenre:Genre? = nil
    @Binding var selectedReadingStatus:ReadingStatus? = nil
    @State private var internalGenre: Genre? = nil
    @State private var internalReadingStatus: ReadingStatus? = nil
    
    @Environment(\.dismiss) var dismiss
    init(selectedGenre: Binding<Genre?>, selectedReadingStatus: Binding<ReadingStatus?>)
    {
        self.selectedGenre = selectedGenre
        self.selectedReadingStatus = selectedReadingStatus
        
        self.internalGenre = .init(rawValue: selecteGenre.wrappedValue?.rawValue ?? "")
        self.internalReadingStatus = .init(rawValue: selectedReadingStatus.wrappedValue?.rawValue ?? "")
    }
    
    var body: some View {
        NavigationStack
        {
            Form
            {
                Section(header: Text("Genre"))
                {
                    Picker("Genre", selection: $internalGenre){
                    Text("Select a genre: ").tag(nil as Genre?)
                    ForEach(Genre.allCases, id: \.self) { genre in
                        Text(genre.rawValue).tag(genre)
                    }
                }
            }
            
            Section(header: Text("Reading Status"))
            {
                Picker("Reading Status", selection: $internalReadingStatus){
                    Text("Select a status: ").tag(nil as ReadingStatus?)
                    ForEach(ReadingStatus.allCases, id\.self){ status in
                        Text(status.rawValue).tag(status)
                    }
                }
            }
            }
        }
    }.navigationTitle("Filter your books")
        .toolbar{
            ToolbarItem(placement:
                    .cancellationAction){
                        Button("Clear"){
                            selectedGenre = nil
                            selectedReadingStatus = nil
                        }
                    }
            ToolbarItem(placement: .confirmationAction)
            {
                Button("Apply")
                {
                    selectedGenre = internalGenre
                    selectedReadingStatus = internalReadingStatus
                    dismiss()
                }
            }
            .disabled(internalGenre == selectedGenre && internalReadingStatus == selectedReadingStatus)
        }
}

//#Preview {
//    FiltersView()
//}
