//
//  ContentView.swift
//  Bookworm
//
//  Created by Edwin Cardenas on 4/30/26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var books: [Book]

    @State private var showingAddScreen = false

    var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
                .navigationTitle("Books")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }
    }
}

#Preview {
    ContentView()
}
