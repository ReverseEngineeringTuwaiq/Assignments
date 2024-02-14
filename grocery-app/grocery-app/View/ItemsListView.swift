//
//  ItemsListView.swift
//  grocery-app
//
//  Created by Bushra Abuhaimed on 09/02/2024.
//

import SwiftUI

struct ItemsListView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var searchText: String = ""
    
    let category: Category
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                Button(action: { dismiss() }) {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(Color.app_black)
                        .font(.title3)
                        .fontWeight(.bold)
                }
                HStack {
                    TextField("Search by item name", text: $searchText)
                        .foregroundStyle(Color.gray)
                        .font(.caption)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(Color.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.3))
                .clipShape(Capsule())
            }
            .padding(.horizontal, 16)
            .padding(.bottom)
            
            ScrollView {
                if searchText.isEmpty {
                    VStack(spacing: 20) {
                        ForEach(items.filter({ $0.category == category })) { item in
                            ItemView(item: item)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 4)
                } else {
                    VStack(spacing: 20) {
                        ForEach(items.filter({ $0.category == category }).filter({ $0.name.lowercased().contains(searchText.lowercased())})) { item in
                            ItemView(item: item)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top)
                }
                
            }
        }
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    ItemsListView(category: .fruits)
        .environmentObject(CartViewModel())
        .environmentObject(ListViewModel())
}
