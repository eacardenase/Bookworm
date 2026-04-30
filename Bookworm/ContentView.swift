//
//  ContentView.swift
//  Bookworm
//
//  Created by Edwin Cardenas on 4/30/26.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool

    var onColors: [Color] = [.red, .yellow]
    var offColors: [Color] = [.white.opacity(0.6), .white.opacity(0.4)]

    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()

        .background(
            LinearGradient(
                colors: isOn ? onColors : offColors,
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
    @State private var rememberMe = false

    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)

            Text(rememberMe ? "On" : "Off")
        }
        .animation(.easeInOut, value: rememberMe)
    }
}

#Preview {
    ContentView()
}
