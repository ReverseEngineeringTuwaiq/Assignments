import SwiftUI

struct CheckoutView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var checkoutViewModel = CheckoutViewModel()
    @State var productIDs: String?
    @Binding var backToRoot: Bool
    
    @State var orderNumber: String?
    
    var body: some View {
        HStack {
            Button{
                self.presentationMode.wrappedValue.dismiss()
            }label:{
                Image(systemName: "chevron.backward")
                    .foregroundStyle(Color.black)
                    .font(.title3)
            }
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        
        
        GeometryReader(content: { geometry in
            VStack(spacing: 10) {
                
                Image("checkout")
                    .resizable()
                    .frame(width: widthPercent(60), height: widthPercent(60))
                    .scaledToFill()
                
                Text("Thank You")
                    .font(.title)
                
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                    if let orderNumber = orderNumber {
                        Text("Your order is completed please check the delivery status with order number \(orderNumber)")
                            .multilineTextAlignment(.center)
                    } else {
                        Text("Order Failed")
                            .multilineTextAlignment(.center)
                    }
                }
                .foregroundColor(.gray)
                .frame(width: widthPercent(90))
                // great thanks my work sir please give a good rating for , sure :)
                
//                NavigationLink(destination: HomeView()){
                    Text("CONTINUE SHOPPING")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 60/255, green: 89/255, blue: 88/255))
                                .shadow(color: .gray, radius: 2, x: 0, y: 2)
                        )
                        .padding()
                        .onTapGesture {
                            backToRoot = true
                        }
                        .onChange(of: backToRoot) { oldValue, newValue in
                            if newValue == true {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
//                }
                
            }
            .onAppear {
                UserDefaults.standard.setValue(Int.random(in: 1000..<600000), forKey: userdefault.generateOrderID)
                orderNumber = "\(UserDefaults.standard.value(forKey: userdefault.generateOrderID)!)"
                if let productIDs = productIDs {
                    checkoutViewModel.updateCheckoutDone(productIDs: productIDs, orderID: "\(UserDefaults.standard.value(forKey: userdefault.generateOrderID)!)")
                    deleteCartData()
                }
            }
        })
        
        
    }
}

#Preview {
    CheckoutView(backToRoot: .constant(false))
}
