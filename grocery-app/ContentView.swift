//
//  ContentView.swift
//  grocery-app
//
//  Created by vdotup on 09/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var didOnboard: Bool = false
    @State private var didSplash: Bool = false
    
    var body: some View {
        if didSplash {
            if didOnboard {
                MainView()
                    .environmentObject(CartViewModel())
                    .environmentObject(ListViewModel())
            } else {
                OnboardingView(didOnboard: $didOnboard)
            }
        } else {
            SplashView(didSplash: $didSplash)
        }
    }
}

#Preview {
    ContentView()
}
