//
//  HomeView.swift
//  grocery-app
//
//  Created by Bushra Abuhaimed on 09/02/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
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
                
                ScrollView(.vertical) {
                    if searchText.isEmpty {
                        VStack {
                            HStack {
                                Image("banner")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 120)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .padding()
                                
                                Spacer()
                                
                                VStack(alignment: .leading) {
                                    Text("Enjoy the special offer")
                                        .font(.headline)
                                    HStack(alignment: .bottom) {
                                        Text("up to")
                                            .font(.headline)
                                        Text("50%")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                    }
                                }
                                .foregroundStyle(Color.white)
                                .padding(.bottom, 30)
                                
                                Spacer()
                            }
                            .background {
                                Color.app_green
                            }
                            .cornerRadius(12)
                            .padding(.horizontal, 16)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Categories")
                                    .font(.headline)
                                    .padding(.horizontal, 16)
                                
                                ScrollView(.horizontal) {
                                    HStack(spacing: 20) {
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
                                                .frame(width: 70)
                                                .padding(12)
                                                .background(category.color)
                                                .cornerRadius(8)
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 16)
                                }
                                .scrollIndicators(.hidden)
                            }
                            .padding(.top)
                            
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Most Popular")
                                    .font(.headline)
                                
                                if let item = items.randomElement() {
                                    ItemView(item: item)
                                }
                            }
                            .padding(.horizontal, 16)
                            .padding(.top)
                        }
                        .padding(.top)
                    } else {
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
    HomeView()
        .environmentObject(CartViewModel())
        .environmentObject(ListViewModel())
}
