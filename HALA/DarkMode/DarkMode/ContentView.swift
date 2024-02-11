//
//  ContentView.swift
//  DarkMode
//
//  Created by 10M on 23/07/1445 AH.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            
            if colorScheme == .dark {
                Rectangle()
            } else {
                Circle()
            }
            
            Text("Hello, world!").foregroundColor(colorScheme == .dark ? .red : .blue)

            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
