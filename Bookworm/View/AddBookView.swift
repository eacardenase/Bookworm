//
//  AddBookView.swift
//  Bookworm
//
//  Created by Edwin Cardenas on 5/3/26.
//

import SwiftData
import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3

    let genres = [
        "Fantasy", "Horror", "Kids", "Mistery", "Poetry", "Romance", "Thriller",
    ]

    var isFormValid: Bool {
        return !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !author.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !genre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)

                    TextField("Author's name", text: $author)
                        .textInputAutocapitalization(.words)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)

                    StarRatingView(rating: $rating)
                }
            }
            .navigationTitle("Add Book")
            .interactiveDismissDisabled()
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .cancel) {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button(role: .confirm) {
                        let newBook = Book(
                            title: title,
                            author: author,
                            genre: genre,
                            review: review,
                            rating: rating
                        )

                        modelContext.insert(newBook)

                        dismiss()
                    } label: {
                        Text("Save")
                    }
                    .disabled(!isFormValid)
                }
            }
        }
    }
}

#Preview {
    AddBookView()
}
