//
//  CategoriesView.swift
//  grocery-app
//
//  Created by vdotup on 09/02/2024.
//

import SwiftUI

struct CategoriesView: View {
    
    @State private var searchText: String = ""
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 15, alignment: .center), count: 3)
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 8) {
                
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
                .padding(.horizontal, 16)
                .padding(.bottom)
                
                if searchText.isEmpty {
                    Text("Categories")
                        .font(.headline)
                        .padding(.horizontal, 16)
                    
                    ScrollView {
                        LazyVGrid(columns: columns, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 25) {
                            ForEach(Category.allCases, id: \.self) { category in
                                NavigationLink(destination: ItemsListView(category: category)) {
                                    VStack {
                                        Image(category.imageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 40)
                                        
                                        Text(category.rawValue)
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundStyle(Color.app_black)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(12)
                                    .background(category.color)
                                    .cornerRadius(8)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                } else {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(items.filter({ $0.name.lowercased().contains(searchText.lowercased())})) { item in
                                ItemView(item: item)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top)
                    }
                }
                
                
            }
        }
    }
}

#Preview {
    CategoriesView()
        .environmentObject(CartViewModel())
        .environmentObject(ListViewModel())
}
