//
//  AddBooksView.swift
//  Bookworm
//
//  Created by Can Cetin on 8.05.2023.
//

import SwiftUI

struct AddBooksView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var rating = 3
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "SciFi", "Drama", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    RatingView(rating: $rating)
                    TextEditor(text: $review)
                } header: {
                    Text("Rate and Write a Review")
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.author = author
                        newBook.genre = genre
                        newBook.rating = Int16(rating)
                        newBook.review = review
                        newBook.title = title
                        
                        try? moc.save()
                        dismiss()
                    }
                }
                
            }
            .navigationTitle("Add Book")
        }
    }
}

struct AddBooksView_Previews: PreviewProvider {
    static var previews: some View {
        AddBooksView()
    }
}
