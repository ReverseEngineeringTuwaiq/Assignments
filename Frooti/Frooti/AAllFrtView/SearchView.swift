import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = FrtViewModel()
    @State var isLike = false
    @State var isShowingSheet = false
    
    @State var searchTerm = ""
    
    
    var filterd: [Froots] {
        guard !searchTerm.isEmpty else {return viewModel.frtt}
        return viewModel.frtt.filter { $0.fruit.localizedCaseInsensitiveContains(searchTerm)}
    }
    @State var sheetD: Froots? = nil
    
   
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(.vertical){
                    VStack(alignment: .leading) {
                            ForEach(filterd, id: \.self) { i in
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
                                        
                                        Text(i.description).padding(.leading,210).padding(.bottom,30).frame(width:350,height:200).lineLimit(4).bold()
                                        
                                        
                                    }
                                }
                            }//: ForEach
                            
                        } //: LazyVGrid
                    } //: VStack
                    .padding(.horizontal)
                }.onAppear {
                    viewModel.readAll()
            }
                .navigationTitle("Product")
                .searchable(text: $searchTerm, prompt: "Search Products")
        }
        }
        
    }


#Preview {
    SearchView()
}

