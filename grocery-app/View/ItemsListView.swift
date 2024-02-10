//
//  ItemsListView.swift
//  grocery-app
//
//  Created by vdotup on 09/02/2024.
//

import SwiftUI

struct ItemsListView: View {
    
    @Environment(\.dismiss) var dismiss
//    @EnvironmentObject private var cartVM: CartViewModel
    
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
                    Text("Search by item name")
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
                VStack(spacing: 20) {
                    ForEach(items.filter({ $0.category == category })) { item in
                        ItemView(item: item)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
            }
        }
        .navigationBarBackButtonHidden()
    }
    
}

#Preview {
    ItemsListView(category: .fruits)
//        .environmentObject(CartViewModel())
}
