//
//  DetailView.swift
//  Bookworm
//
//  Created by Edwin Cardenas on 5/3/26.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    let book: Book

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFit()

                Text(book.title.uppercased())
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.5))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }

            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)

            Text(book.review)
                .padding()

            StarRatingView(rating: .constant(book.rating))
                .font(.title2)
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(
            for: Book.self,
            configurations: config
        )
        let example = Book(
            title: "The Way of Kings",
            author: "Brandon Sanderson",
            genre: "Fantasy",
            review: "I love Shallan's story!",
            rating: 5
        )

        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text(
            "Failed to create preview with error: \(error.localizedDescription)"
        )
    }
}
