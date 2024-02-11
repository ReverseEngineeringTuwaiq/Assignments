import SwiftUI

struct CartView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var checkoutViewModel = CheckoutViewModel()
    
    
    @State var cartArr: [CartModel]?
    @State var quantity: String = "1_1"
    @State var subTotal: Float?
    @State var extraFee: Float = 0
    @State var showCheckout: Bool = false
    @Binding var backToRoot: Bool
    
    
    var body: some View {
                    
        HStack {
            Button{
                self.presentationMode.wrappedValue.dismiss()
            }label:{
                Image(systemName: "chevron.backward")
                    .foregroundStyle(Color.black)
                    .font(.title3)
            }
            Spacer()
            
            Text("My Cart")
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
            
        ZStack {
//            NavigationLink(destination: CheckoutView(), isActive: $showCheckout) {
//                EmptyView()
//            }
//            .frame(maxHeight: 0)
            //        GeometryReader(content: { geometry in
            VStack {
                
                ScrollView {
                    if let cartArr = cartArr {
                        ForEach(cartArr.reversed()) { data in
                            CartCell(data: data, qty: $quantity)
                            Divider()
                        }
                    }
                }
                .onChange(of: quantity) { oldValue, newValue in
                    
                    let firstQty = newValue.components(separatedBy: "_").first
                    let lstId = newValue.components(separatedBy: "_").last
                    print("\(String(describing: firstQty))_\(lstId ?? "1")")
                    for i in 0..<cartArr!.count {
                        if lstId == cartArr![i].name {
                            cartArr![i].qty = firstQty?.toInt()
                            saveData(val: cartArr![i])
                            
                            subTotal = getTotalAmt()
                            
                        }
                    }
                    
                }
                
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Sub Total")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("$\(subTotal ?? 0)")
                            .bold()
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Delivery Fee")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("$\(extraFee)")
                            .bold()
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Total Amount")
                            .bold()
                            .font(.system(size: 14))
                        Spacer()
                        Text("$\((subTotal ?? 0)+extraFee)")
                            .bold()
                            .font(.system(size: 14))
                    }
                }
                
                if let totalid = getTotalIDs(), totalid.isEmpty == false  {
                    
                    NavigationLink(destination: CheckoutView(productIDs: totalid, backToRoot: $backToRoot)){
                        
                            Text("CHECKOUT")
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
                    }
                } else {
                    
                }
                
                
            }
            .frame(width: widthPercent(90))
            .onAppear(perform: {
                cartArr = getCartData()
                subTotal = getTotalAmt()
            })
            //        })
        }
        .onChange(of: backToRoot) { oldValue, newValue in
            if newValue == true {
                self.presentationMode.wrappedValue.dismiss()
            }
        } // great idea hahaha
        
    }
}

#Preview {
    CartView(backToRoot: .constant(false))
}


struct CartCell: View {
    
    var data: CartModel?
    @Binding var qty: String
    
    
    
    var body: some View {
        
        HStack {
            AsyncImage(url: URL(string: data?.image ?? "")) { image in
                image
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(4.0)
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
//            Image("sofa-361")
//                .resizable()
//                .frame(width: 80, height: 80)
//                .cornerRadius(4.0)
//                .scaledToFill()
            
            VStack(alignment: .leading) {
                Text(data?.name ?? "")
                    .bold()
                    .font(.system(size: 15))
                
                Text(data?.desc ?? "")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                HStack {
                    HStack {
                        Button(action: {
                            if data?.qty ?? 1 > 1 {
                                qty = "\((data?.qty ?? 1) - 1)_\(data?.name ?? "")"
                            } else {
                                print("1")
                            }
                        }) {
                            Text("-")
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                                .frame(width: 20, height: 20)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.white)
                                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                )
                        }
                        
                        Text("\(data?.qty ?? 1)")
                            .font(.system(size: 15))
                        
                        Button(action: {
                            qty = "\((data?.qty ?? 1) + 1)_\(data?.name ?? "")"
                        }) {
                            Text("+")
                                .font(.system(size: 12))
                                .fontWeight(.bold)
                                .frame(width: 20, height: 20)
                                .background(
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.white)
                                        .shadow(color: .gray, radius: 2, x: 0, y: 2)
                                )
                        }
                    }
                    .padding(4)
                    .background(RoundedRectangle(cornerRadius: 4).fill(Color.white).shadow(color: .gray, radius: 2, x: 0, y: 2))
                    
                    Spacer()
                
                    Text("$\(data?.price ?? "")")
                        .bold()
                        .font(.system(size: 12))
                }
            }
        }
    }
}

