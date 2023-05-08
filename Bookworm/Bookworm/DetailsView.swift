//
//  DetailsView.swift
//  Bookworm
//
//  Created by Can Cetin on 8.05.2023.
//

import SwiftUI

struct DetailsView: View {
    let book: Book
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Text(book.title ?? "Unknown Title")
                    .font(.largeTitle)
                    .padding(20)
                Text(book.author ?? "Unknown Author")
                    .font(.headline)
                RatingView(rating: .constant(Int(book.rating)))
                    .font(.largeTitle)
                    .padding(20)
                Text(book.review ?? "Unknown Review")
            }
        }
    }
}
