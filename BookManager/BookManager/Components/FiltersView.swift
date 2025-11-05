//
//  FiltersView.swift
//  BookManager
//
//  Created by Emiliano on 11/3/25.
//

import SwiftUI

struct FiltersView: View {
    @Binding var selectedGenre: Genre?
    @Binding var selectedReadingStatus: ReadingStatus?
    
    @State private var internalGenre: Genre?
    @State private var internalReadingStatus: ReadingStatus?
    
    @Environment(\.dismiss) var dismiss
    
    init(selectedGenre: Binding<Genre?>, selectedReadingStatus: Binding<ReadingStatus?>) {
        
        self._selectedGenre = selectedGenre
        self._selectedReadingStatus = selectedReadingStatus
        
        
        self._internalGenre = State(initialValue: selectedGenre.wrappedValue)
        self._internalReadingStatus = State(initialValue: selectedReadingStatus.wrappedValue)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Genre")) {
                    Picker("Genre", selection: $internalGenre) {
                        Text("Select a genre: ").tag(nil as Genre?)
                        ForEach(Genre.allCases, id: \.self) { genre in
                            Text(genre.rawValue).tag(genre as Genre?)
                        }
                    }
                }
                
                Section(header: Text("Reading Status")) {
                    Picker("Reading Status", selection: $internalReadingStatus) {
                        Text("Select a status: ").tag(nil as ReadingStatus?)
                        ForEach(ReadingStatus.allCases, id: \.self) { status in
                            Text(status.rawValue).tag(status as ReadingStatus?)
                        }
                    }
                }
            }
            .navigationTitle("Filter your books")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Clear") {
                        
                        internalGenre = nil
                        internalReadingStatus = nil
                        
                        
                        applyAndDismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Apply") {
                        applyAndDismiss()
                    }
                    
                    .disabled(internalGenre == selectedGenre && internalReadingStatus == selectedReadingStatus)
                }
            }
        }
    }
    
    private func applyAndDismiss() {
        selectedGenre = internalGenre
        selectedReadingStatus = internalReadingStatus
        dismiss()
    }
}
//#Preview {
//    FiltersView()
//}
