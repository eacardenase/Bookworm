//
//  ContentView.swift
//  Bookworm
//
//  Created by Edwin Cardenas on 4/30/26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query var students: [Student]

    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
        }
    }
}

#Preview {
    ContentView()
}
