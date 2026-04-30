//
//  ContentView.swift
//  Bookworm
//
//  Created by Edwin Cardenas on 4/30/26.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationStack {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
