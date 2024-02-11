import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    @State var backToRoot: Bool = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                HomeHeaderView(viewModel: viewModel, backToRoot: $backToRoot)
                ScrollView(showsIndicators: false){
                    VStack {
                        Spacer()
                        Image("sofa-361")
                                    .resizable()
                                    .frame(height: 250)
                        Text("Popular Categories")
                            .font(.title2)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .bold()
                            .padding()
                        HomeCatView(viewModel: viewModel)
                        HomeItemsView(viewModel: viewModel)
                        Spacer()
                    }
                    
                }
                HomeNavigationView(viewModel: viewModel)
            }//: VStack
            .padding()
            .onAppear{
                backToRoot = false
                viewModel.loadStock()
        }
        }
    }
}

struct HomeHeaderView: View {
    @StateObject var viewModel: HomeViewModel
    @Binding var backToRoot: Bool
    var body: some View {
        HStack{
            NavigationLink(destination: SearchView()){
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color.black)
                    .font(.title3)
            }
            Spacer()
            VStack {
                Text("FURNITURE")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text("MAKE YOUR HOME WELCOMING")
                    .foregroundStyle(Color(hex: "#358a8b"))
                    .font(.footnote)
            }
            Spacer()
            NavigationLink(destination: CartView(backToRoot: $backToRoot)){
                Image(systemName: "bag")
                    .foregroundStyle(Color.black)
                    .font(.title3)
            }
        }.frame(maxWidth: .infinity ,alignment: .leading).padding(.horizontal)
            .frame(height: 50)
    }
}

struct HomeNavigationView: View {
    @StateObject var viewModel: HomeViewModel
    let cats = ["Home", "Favorites", "Orders"]
    var body: some View {
        HStack {
            ForEach(cats, id: \.self) { cat in
                VStack {
                    NavigationLink(destination: destinationView(for: cat)) {
                        Image(systemName: viewModel.iconName(for: cat))
                            .font(.title)
                            .foregroundStyle(Color.black)
                    }
                    Text(cat)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
            .padding(.horizontal)
            .frame(width: 100, height: 40)
        }
    }
    @ViewBuilder
    private func destinationView(for category: String) -> some View {
        switch category {
        case "Home":
            HomeView(viewModel: viewModel)
        case "Favorites":
            FavouriteView(viewModel: viewModel)
        case "Orders":
            OrdersView(viewModel: viewModel)
        default:
            EmptyView()
        }
    }
}

struct HomeCatView: View {
    @StateObject var viewModel: HomeViewModel
    let cats = ["Sofas", "TV Unit", "Chair", "Beds", "Table"]

    var body: some View {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(cats, id: \.self) { cat in
                        NavigationLink(destination: CategoryView(category: cat)) {
                            VStack {
                                Image(systemName: viewModel.iconName(for: cat))
                                    .foregroundStyle(Color(hex: "#358a8b"))
                                    .font(.title)
                                Text(cat)
                                    .foregroundStyle(Color.black)
                            }
                            .padding()
                        }
                    }
                }
            }
    }
}


struct HomeItemsView: View {
    @StateObject var viewModel: HomeViewModel
    let columns: [GridItem] = [
        GridItem(.fixed(170), spacing: 16),
        GridItem(.fixed(170), spacing: 16)
    ]
    @State private var isLiked = false
    var body: some View {
        VStack(alignment: .leading) {
            Text("New Arrivals")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.stock, id: \.self) { stock in
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.white)
                            .shadow(radius: 5)
                            .frame(width: 170, height: 220)
                            .overlay {
                                VStack {
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
                                            viewModel.addToCart(for: stock)
                                        }) {
                                            Image(systemName: viewModel.cartItems.contains(where: {$0.id == stock.id}) ? "checkmark.circle.fill" : "plus.circle.fill")
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
                        .padding([.top, .trailing], 5)
                    } //: ZStack
                }
            } //: LazyVGrid
            .padding(.horizontal)
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
    }
}

#Preview {
    HomeView()
}
