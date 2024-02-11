import SwiftUI

struct CategoryView: View {
    @StateObject var viewModel = HomeViewModel()
    @Environment(\.presentationMode) var presentationMode
    var category: String
    let columns: [GridItem] = [
        GridItem(.fixed(170), spacing: 16)
    ]
    @State private var isLiked = false
    var body: some View {
        Button{
            self.presentationMode.wrappedValue.dismiss()
        }label:{
            Image(systemName: "chevron.backward")
                .foregroundStyle(Color.black)
                .font(.title3)
        }
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        ScrollView {
            VStack(alignment: .leading) {
                Text(category)
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()

                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.stock.filter({ $0.category == category }), id: \.id) { stock in
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white)
                                .shadow(radius: 5)
                                .frame(width: 370, height: 120)
                                .overlay {
                                    HStack {
                                        AsyncImage(url: URL(string: stock.image)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        Text("\(stock.desc)")
                                            .bold()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        HStack {
                                            Text("$\(stock.price)")
                                                .bold()
                                            Spacer()
                                            Button(action: {
                                                // action
                                                saveData(val: CartModel(name: stock.category, id: "\(stock.id)", desc: stock.desc, price: stock.price, image: stock.image, qty: 1))
                                            }) {
                                                Image(systemName: "plus.circle.fill")
                                                    .foregroundColor(Color(hex: "#358a8b"))
                                                    .font(.title)
                                            }
                                        }
                                    }
                                    .padding(7)
                            }
                            Button(action: {
                                viewModel.toggleLike(for: stock)
                            }) {
                                Image(systemName: "heart.fill")
                                    .foregroundColor(viewModel.likedItems.contains(where: {$0.id == stock.id}) ? .red : Color(hex: "#358a8b"))
                                    .padding(5)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .shadow(radius: 2)
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity, alignment: .topTrailing)
                            .padding([.top, .trailing], 8)
                        } //: ZStack
                    }
                } //: LazyVGrid
                .padding(.horizontal)
            }
            .onAppear{
                viewModel.loadStock()
        }
        }
    }
}

#Preview {
    CategoryView(category: "Sofas")
}
