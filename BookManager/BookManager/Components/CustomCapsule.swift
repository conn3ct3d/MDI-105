//
//  CustomCapsule.swift
//  BookManager
//
//  Created by mbair on 10/24/25.
//

import SwiftUI

struct CustomCapsule: View {
    let text: String
    var color: Color = .accentColor
    
    init(_ text: String, color: Color = .accentColor.opacity(0.5)) {
        self.text = text
        self.color = color
    }
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .foregroundColor(.primary)
            .background(color)
            .clipShape(Capsule())
    }
}
//#Preview {
//    CustomCapsule()
//}
