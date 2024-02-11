import SwiftUI

struct ShowList: View {
    
    @StateObject var viewModel = FrtViewModel()
    @StateObject var vm = CartViewModel()
    @State var isLike = false
    @State var isShowingSheet = false
    
    @State var sheetD: Froots? = nil
    
    
    let columns: [GridItem] = [
        GridItem(.fixed(170), spacing: 13)
    ]
    
    var body: some View {
        ZStack {
            ScrollView(.vertical){
                VStack(alignment: .leading) {
                    Text("All the products")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.frtt, id: \.self) { i in
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.white)
                                    .shadow(radius: 5)
                                    .frame(width: 380, height: 220)
                                    .overlay {
                                        VStack {
                                            AsyncImage(url: URL(string: i.pic)) { image in
                                                image.resizable()
                                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                                    .scaledToFit()
                                                    .padding(.trailing, 150)
                                                
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .overlay {
                                                VStack {
                                                    HStack {
                                                        Text(" \(i.fruit)")
                                                            .bold()
                                                            .frame(maxWidth: .infinity, alignment: .leading)
                                                            .font(.largeTitle)
                                                            .foregroundColor(.white)
                                                        
                                                        Text("$\(i.price)")
                                                            .bold()
                                                        
                                                        Spacer()
                                                    }
                                                }.padding(.top, 150)
                                                Spacer()
                                            }.overlay(content: {
                                                Button(action: {
                                                    isShowingSheet.toggle()
                                                    sheetD = i
                                                }) {
                                                    Rectangle()
                                                        .opacity(0)
                                                }.sheet(item: $sheetD) {i in
                                                    SheetView(Name: i.fruit , Desc: i.description, prc: i.price, pics: i.pic)
                                                }

                                            })
                                            .padding(7)
                                        }
                                    }
                            }
                            .overlay {
                                VStack {
                                    
                                    Button(action: {
                                        
                                        vm.addToCart(item: i)
                                    }) {
                                        Image(systemName: "cart")
                                            .padding(5)
                                            .foregroundColor(.white)
                                            .background(Color.orange)
                                            .clipShape(Circle())
                                            .shadow(radius: 2)
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                    .padding([.top, .trailing], 5)
                                    
                                    Text(i.description).padding(.leading,210).padding(.bottom,30).frame(width:350,height:200).lineLimit(4).bold()
                                    
                                    
                                }
                            }
                        } //: ForEach
                    } //: LazyVGrid
                } //: VStack
                .padding(.horizontal)
            }
        }
        .onAppear {
            viewModel.readAll()
        }
    }
}

#Preview {
    ShowList()
}
