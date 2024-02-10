//
//  CartView.swift
//  grocery-app
//
//  Created by vdotup on 10/02/2024.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var cartVM: CartViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Cart")
                .font(.headline)
                .padding(.horizontal, 16)
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(cartVM.cartItems) { item in
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
    CartView()
        .environmentObject(CartViewModel())
}
