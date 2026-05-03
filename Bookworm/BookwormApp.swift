//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Edwin Cardenas on 4/30/26.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
