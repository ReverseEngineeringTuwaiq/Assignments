//
//  ItemView.swift
//  grocery-app
//
//  Created by vdotup on 10/02/2024.
//

import SwiftUI

struct ItemView: View {
    
    @EnvironmentObject private var cartVM: CartViewModel
    @EnvironmentObject private var listVM: ListViewModel
    
    let item: Item
    
    var inCart: Bool {
        return cartVM.cartItems.contains(item)
    }
    
    var inList: Bool {
        return listVM.listItems.contains(item)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(16)
                .frame(width: 100, height: 100)
                .background(item.category.color)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                            .fontWeight(.medium)
                        Text("$\(String(format: "%.0f", item.cost))")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    if inCart {
                        Button(action: { removeFromCart(item: item) }) {
                            Image(systemName: "trash")
                                .foregroundStyle(Color.app_red)
                        }
                    }
                }
                
                Spacer()
                HStack(alignment: .center) {
                    if !inList {
                        Button(action: { inCart ? moveToList(item: item) : addToList(item: item) }) {
                            HStack {
                                Image("list-icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 15, height: 15)
                                Text(inCart ? "Move to list" : "Add to list")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundStyle(Color.gray)
                            }
                        }
                    }
                    Spacer()
                    if !inCart {
                        Button(action: { addToCart(item: item) }) {
                            HStack {
                                Image("cart-icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 15, height: 15)
                                    .colorInvert()
                                Text("Add to cart")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundStyle(Color.white)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                                .background {
                                    Color.app_green
                                }
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .padding(8)
        }
        .frame(height: 100)
        .padding(6)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(Color.white)
                .shadow(color: .black.opacity(0.25), radius: 3, x: 0, y: 3)
        }
    }
    
    private func addToCart(item: Item) {
        if inList {
            withAnimation {
                if let index = listVM.listItems.firstIndex(of: item) {
                    listVM.listItems.remove(at: index)
                }
            }
        }
        
        withAnimation {
            cartVM.cartItems.append(item)
        }
    }
    
    private func removeFromCart(item: Item) {
        if inCart {
            withAnimation {
                if let index = cartVM.cartItems.firstIndex(of: item) {
                    cartVM.cartItems.remove(at: index)
                }
            }
        }
        
        
    }
    
    private func addToList(item: Item) {
        withAnimation {
            listVM.listItems.append(item)
        }
    }
    
    private func moveToList(item: Item) {
        if inCart {
            withAnimation {
                if let index = cartVM.cartItems.firstIndex(of: item) {
                    cartVM.cartItems.remove(at: index)
                }
            }
        }
        withAnimation {
            listVM.listItems.append(item)
        }
    }
}

#Preview {
    ItemView(item: items[0])
        .environmentObject(CartViewModel())
        .environmentObject(ListViewModel())
}
