//
//  CartView.swift
//  grocery-app
//
//  Created by Bushra Abuhaimed on 10/02/2024.
//

import SwiftUI

struct CartView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var cartVM: CartViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Cart")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
                .padding(.horizontal, 16)
            
            if cartVM.cartItems.isEmpty {
                Spacer()
                Text("Empty!")
                    .foregroundStyle(Color.gray)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                Spacer()
            } else {
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(cartVM.cartItems) { item in
                            ItemView(item: item)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 4)
                }
                
                
                VStack(spacing: 8) {
                    HStack {
                        Text("Price")
                            .font(.headline)
                            .fontWeight(.medium)
                        Spacer()
                        Text("$\(String(format: "%.0f", getTotal() + 20))")
                            .font(.headline)
                            .fontWeight(.medium)
                    }
                    
                    HStack {
                        Text("Delivery")
                            .font(.headline)
                            .fontWeight(.medium)
                        Spacer()
                        Text("$20")
                            .font(.headline)
                            .fontWeight(.medium)
                    }
                    
                    HStack {
                        Text("Total")
                            .font(.title3)
                            .fontWeight(.bold)
                        Spacer()
                        Text("$\(String(format: "%.0f", getTotal() + 20))")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal, 16)
                
                Button(action: checkout) {
                    Text("Checkout")
                        .foregroundStyle(Color.white)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.app_green)
                        .cornerRadius(12)
                        .padding(.horizontal, 16)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .padding(.bottom, 40)
    }
    
    private func getTotal() -> Double {
        var total: Double = 0
        for item in cartVM.cartItems {
            total += item.cost * Double(item.quantity)
        }
        return total
    }
    
    private func checkout() {
        
    }
    
}

#Preview {
    CartView()
        .environmentObject(CartViewModel())
        .environmentObject(ListViewModel())
}
