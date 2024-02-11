import SwiftUI

struct gridView: View {
    
    @StateObject var viewModel = FrtViewModel()
    @StateObject var vm = CartViewModel()
    @State var sheetD: Froots? = nil
    @State var isShowingSheet = false
    
    let columns: [GridItem] = [
        GridItem(.fixed(170), spacing: 13),
        GridItem(.fixed(170), spacing: 13)
    ]
    
    var body: some View {
        mainContentView
            .onAppear {
                viewModel.readAll()
            }
            .ignoresSafeArea()
    }

    private var mainContentView: some View {
        ZStack {
            VStack(alignment: .leading) {
                gridContent
                    .padding(.horizontal)
            }
        }
    }

    private var gridContent: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(viewModel.frtt, id: \.self) { i in
                gridItem(for: i)
            }
        }
    }

    private func gridItem(for fruit: Froots) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .shadow(radius: 5)
                .frame(width: 170, height: 220)
                .overlay {
                    VStack {
                        AsyncImage(url: URL(string: fruit.pic)) { image in
                            image.resizable()
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        } placeholder: {
                            ProgressView()
                        }
                        Text("\(fruit.fruit)")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            Text("$\(fruit.price)")
                                .bold()
                            Spacer()
                            Button(action: {
                                // action
                            }) {
                                Image(systemName: " ")
                                    .font(.title)
                                    .foregroundStyle(.orange, .white)
                            }
                        }
                    }
                    .padding(7)
                }
                .overlay(content: {
                    Button(action: {
                        isShowingSheet.toggle()
                        sheetD = fruit
                    }) {
                        Rectangle()
                            .opacity(0)
                    }
                    .sheet(item: $sheetD) { fruit in
                        SheetView(Name: fruit.fruit, Desc: fruit.description, prc: fruit.price, pics: fruit.pic)
                    }
                })
                .overlay {
                    VStack(alignment: .leading){
                        Button(action: {
                            vm.addToCart(item: fruit)
                        }) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundStyle(.orange,.white)
                        }
                    }
                    .padding(.top, 150)
                    .padding(.leading, 120)
                }
        }
    }


}

struct gridView_Previews: PreviewProvider {
    static var previews: some View {
        gridView()
    }
}
