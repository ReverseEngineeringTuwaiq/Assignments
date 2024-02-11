//
//  AllCart.swift
//  Frooti
//
//  Created by 10M on 29/07/1445 AH.
//

import Foundation



struct CartItem: Identifiable {
    let id: Int
    let fruit: Froots?
    var quantity: Int
}



class CartViewModel: ObservableObject {
    @Published private(set) var cartItems: [CartItem] = []
    @Published var isCartEmpty: Bool = true
    
    
    func addToCart(item: Froots) {
        let cartItem = CartItem(id: item.id, fruit: item, quantity: 1)
        cartItems.append(cartItem)
        print("The item in the Array is : \(cartItems)\n")
        isCartEmpty = cartItems.isEmpty
    }
    
    func removeFromCart(item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems.remove(at: index)
            isCartEmpty = cartItems.isEmpty
        }
    }
    
    func clearCart() {
        cartItems.removeAll()
        isCartEmpty = true
    }
}



