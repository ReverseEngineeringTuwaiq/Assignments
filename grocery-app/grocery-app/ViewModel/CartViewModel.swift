//
//  CartViewModel.swift
//  grocery-app
//
//  Created by Bushra Abuhaimed on 10/02/2024.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published var cartItems: [Item] = []
    
}
