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
    @Environment(\.modelContext) var modelContext

    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
    let lastNames = ["Granger", "Potter", "Lovegood", "Weasley"]

    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Add", systemImage: "plus", role: .confirm) {
                        let chosenFirstName = firstNames.randomElement()!
                        let chosenLastName = lastNames.randomElement()!

                        let student = Student(
                            id: UUID(),
                            name: "\(chosenFirstName) \(chosenLastName)"
                        )

                        withAnimation {
                            modelContext.insert(student)
                        }
                    }
                    .tint(.pink)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
