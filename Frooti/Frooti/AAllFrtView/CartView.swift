import SwiftUI

struct CartView: View {
    @StateObject var vm = CartViewModel()

    var body: some View {
        VStack {
            if vm.cartItems.isEmpty {
                Text("Your cart is empty")
                    .padding()
            } else {
                List(vm.cartItems, id: \.id) { item in
                    if let fruit = item.fruit {
                        VStack {
                            Image(fruit.pic)
                                .resizable()
                                .frame(width: 50, height: 50)
                            Text(fruit.fruit)
                    
                            Button(action: {
                                vm.removeFromCart(item: item)
                            }) {
                                Image(systemName: "trash")
                            }
                        }
                    } else {
                        Text("Item not available")
                    }
                }
            }
            
            Spacer()
            
            Button("Clear Cart") {
                vm.clearCart()
            }
            .padding()
        }
        .navigationTitle("Cart")
        .onReceive(vm.$cartItems) { cartItems in
            
            vm.isCartEmpty = cartItems.isEmpty
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
