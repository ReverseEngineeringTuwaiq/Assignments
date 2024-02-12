//
//  MainView.swift
//  Slumber
//
//  Created by Abdulrahim on 27/07/1445 AH.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            TabView {
                Home()
                    .tabItem {
                        Label("Home", systemImage: "globe")
                    }
                    .tag(0)
                
                SoundEffect()
                    .tabItem {
                        Label("Effects", systemImage: "music.note")
                    }
                    .tag(1)
                ANap()
                    .tabItem{
                        Label("Take a Nap", systemImage: "moon.zzz.fill")
                    }
                    .tag(2)
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person")
                    }
                    .tag(3)
            }
            .navigationTitle("Slumber")
            .accentColor(.white)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    MainView()
}
