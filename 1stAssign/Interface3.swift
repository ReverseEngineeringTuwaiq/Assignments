//
//  Interface3.swift
//  swiftAssignment
//
//  Created by Bushra Abuhaimed on 20/07/1445 AH.
//

import SwiftUI

struct Interface3: View {
    var body: some View {
        VStack {
            SearchBarView()
            FilterView()
            ResultListTitleView()
            ResultListView()
        }
    }
}

// MARK: - SearchBarView
struct SearchBarView: View {
    var body: some View {
        HStack {
           Image(systemName: "arrow.backward")
               .foregroundStyle(.black)
               .bold()

            RoundedRectangle(cornerRadius: 15)
                .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray.opacity(0.1))
                .overlay{
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .opacity(0.3)
                        Text("Homes")
                        Spacer()
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .foregroundColor(.blue)
                    }
                    .padding()
                }
        }
        .padding([.leading, .trailing], 20)
    }
}

// MARK: - FilterView
struct FilterView: View {
    var filterArray = ["✅ All", "🏡 House", "🏘️ Villa", "🏢 Apartment"]
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(filterArray, id: \.self) { name in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 30)
                            .foregroundColor(.white)
                            .border(.blue)
                            .border(.blue, width: 2)
                            .cornerRadius(30)
                        Text(name)
                            .foregroundStyle(.black)
                            .background(.clear)
                            .padding()
                    }
                }
            }
        }
        .frame(height: 100)
        .padding([.leading, .trailing], 20)
    }
}

// MARK: - ResultListTitleView
struct ResultListTitleView: View {
    var body: some View {
        HStack {
            Text("866 Founds")
                .bold()
            Spacer()
            HStack {
                Image(systemName: "line.3.horizontal.decrease.circle.fill")
                    .foregroundColor(.blue)
                Image(systemName: "square.grid.2x2")
            }
        }
        .padding([.leading, .trailing], 20)
    }
}

// MARK: - ResultListView
struct ResultListView: View {
    var listArray = ["Lucky Lake", "Home Away", "Tranquil Tavern", "Tranquil Del"]
    
    var body: some View {
        List(listArray, id: \.self) { name in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.gray.opacity(0.2))
                    .frame(height: 150)
                
                HStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.blue.opacity(0.2))
                        .frame(width: 100, height: 100)
                    VStack(alignment: .leading) {
                        Text(name)
                        Text("abcdefg")
                    }
                    Spacer()
                    VStack(spacing: 20) {
                        Image(systemName: "suit.heart")
                        VStack {
                            Text("32$")
                                .bold()
                                .foregroundColor(.blue)
                            Text("/ night")
                                .font(.system(size: 10))
                        }
                    }
                }
                .padding([.leading, .trailing], 20)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    Interface3()
}
