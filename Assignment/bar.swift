//
//  bar.swift
//  swiftAssignment
//
//  Created by Bushra Abuhaimed on 19/07/1445 AH.
//

import SwiftUI
struct Prand: Identifiable{
    var id: UUID = UUID()
    var image: String
    var title: String
    var supTitle: String?
}

var prand1: Prand = Prand(image: "envelope.fill", title: "Email")
var prand2: Prand = Prand(image: "car", title: "Nike", supTitle: "$7 Shpping , 1-5")
var prand3: Prand = Prand(image: "house", title: "Addidas", supTitle: "$7 Shpping , 1-5")
var prand4: Prand = Prand(image: "phone", title: "Amazon.com")

var allPrands: [Prand] = [
    prand1,
    prand2,
    prand3,
    prand4
]

struct SwiftUIView: View {
    var body: some View {
        VStack {
            ScrollView {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                ForEach(allPrands , id: \.id) { i in
                    HStack{
                        Image(systemName: "\(i.image)")
                            .resizable()
                            .frame(width: 50 , height: 50)
                            .foregroundStyle(.red)
                        VStack{
                            Text("\(i.title)")
                            Text("\(i.supTitle ?? "")")
                        }.padding()
                        Spacer()
                        Button("Shop"){
                            
                        }
                    }.border(.gray)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    SwiftUIView()
}
