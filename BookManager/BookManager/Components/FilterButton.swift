//
//  FilterButton.swift
//  BookManager
//
//  Created by mbair on 11/5/25.
//

import SwiftUI

struct FilterButton: View {
    let action: () -> Void
    var body: some View {
        Button(action:action)
        {
            Image(systemName:"line.horizontal.3.decrease.circle")
        }
        .accessibilityLabel("Open filtering options")
    }
}

