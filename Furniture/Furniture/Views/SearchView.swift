//
//  SwiftUIView.swift
//  Furniture
//
//  Created by Admin on 07/02/2024.
//

import SwiftUI

struct SearchView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var search = ""
    @StateObject var viewModel = HomeViewModel()
    let columns: [GridItem] = [
        GridItem(.fixed(170), spacing: 16)
    ]
    @State private var isLiked = false
    var body: some View {
        HStack{
            Button{
                self.presentationMode.wrappedValue.dismiss()
            }label: {
                Image(systemName: "chevron.backward")
                    .foregroundStyle(Color.black)
                    .font(.title3)
            }
            Spacer()
            TextField("Search...", text: $search)
//                .textFieldStyle(.roundedBorder)
                .frame(width: 300)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: .infinity ,alignment: .leading).padding(.horizontal)
            .frame(height: 50)
        Rectangle()
            .fill(.gray).opacity(0.5)
            .frame(height: 1)
        ScrollView{
            Spacer()
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(viewModel.stock.filter({ $0.desc.lowercased().contains(search.lowercased())}), id: \.id) { stock in
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
        .padding(.bottom)
        .onAppear{
            viewModel.loadStock()
        }
    }
}

#Preview {
    SearchView()
}

