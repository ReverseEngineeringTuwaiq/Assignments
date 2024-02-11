//
//  TapBar.swift
//  Frooti
//
//  Created by 10M on 28/07/1445 AH.
//

import SwiftUI

struct TapBar: View {
    var body: some View {
        TabView {
            
            
            
            
            ContentView()
                .tabItem {
                    Label("Home", systemImage: "house")
                    
                }
            
            ShowList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
            
            SearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            
            
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
            
        }.accentColor(.orange)
    }
}

#Preview {
    TapBar()
}
