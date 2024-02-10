//
//  MainView.swift
//  grocery-app
//
//  Created by vdotup on 09/02/2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var cartVM: CartViewModel
    @EnvironmentObject private var listVM: CartViewModel
    
    private enum Tab: String, CaseIterable {
        case home
        case categories
        case delivery
        case list
        case cart
    }
    
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                HStack(spacing: 2) {
                    Image("mappin")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                    Text("Deliver to:")
                        .font(.headline)
                        .fontWeight(.heavy)
                    
                    Text("Maadi, Cairo")
                }
                Spacer()
                Image("person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal, 16)
            .padding(.bottom)
            
            ZStack {
                switch selectedTab {
                case .home:
                    HomeView()
                        .environmentObject(cartVM)
                        .environmentObject(listVM)
                case .categories:
                    CategoriesView()
                        .environmentObject(cartVM)
                        .environmentObject(listVM)
                case .delivery:
                    DeliveryView()
                case .list:
                    ListView()
                        .environmentObject(cartVM)
                        .environmentObject(listVM)
                case .cart:
                    CartView()
                        .environmentObject(cartVM)
                        .environmentObject(listVM)
                }
            }
            .frame(maxHeight: .infinity)
            
            Divider()
            
            HStack {
                Button(action: {
                    withAnimation {
                        selectedTab = .home
                    }
                }, label: {
                    Image(selectedTab == .home ? "home-icon-selected" : "home-icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                })
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        selectedTab = .categories
                    }
                }, label: {
                    Image(selectedTab == .categories ? "category-icon-selected" : "category-icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                })
                
                Spacer()
                Spacer()
                Spacer()
                
                Button(action: {
                    withAnimation {
                        selectedTab = .delivery
                    }
                }, label: {
                    Image(selectedTab == .delivery ? "delivery-icon-selected" : "delivery-icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(selectedTab == .delivery ? Color.app_green : Color.gray)
                })
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        selectedTab = .list
                    }
                }, label: {
                    Image(selectedTab == .list ? "list-icon-selected" : "list-icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                })
            }
            .padding(.horizontal, 30)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .overlay {
                Button(action: {
                    withAnimation {
                        selectedTab = .cart
                    }
                }, label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(Color.app_green)
                            .shadow(color: .black.opacity(0.25), radius: 5, x: 0, y: 4)
                        Image("cart-icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .colorInvert()
                            .background(Color.app_green)
                    }
                })
                .frame(width: 58, height: 58)
                .offset(x: 0, y: -32)
                .overlay {
                    if !cartVM.cartItems.isEmpty {
                        Circle()
                            .frame(width: 22, height: 22)
                            .foregroundColor(Color.red)
                            .overlay {
                                Text("\(cartVM.cartItems.count)")
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.white)
                            }
                            .overlay {
                                Circle()
                                    .stroke(Color.white, lineWidth: 1)
                            }
                            .offset(x: 25, y: -55)
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(CartViewModel())
        .environmentObject(ListViewModel())
}
