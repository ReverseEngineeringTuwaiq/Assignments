//
//  PpList.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 21/07/1445 AH.
//

import SwiftUI

struct PpListArr: Identifiable {
    var id: UUID = UUID()
    var MainImage: String
    var title: String
    var date: String
    var price: String
    var join: String
}

var Ar1: PpListArr = PpListArr(MainImage: "cox", title: "Cox's Bazar", date: "21 Feb-27 Feb", price: "€\n7000", join: "26 Peaple Joined.")

var Ar2: PpListArr = PpListArr(MainImage: "sajek", title: "Sajek Vally", date: "08 Mar-13Mar", price: "€\n9000", join: "14 Peaple Joined.")

var Ar3: PpListArr = PpListArr(MainImage: "ban", title: "Bandarban", date: "12 Mar-18 Mar", price: "€\n8500" , join: "08 Peaple Joined.")

var Ar4: PpListArr = PpListArr(MainImage: "ku", title: "Kuakata Sea", date: "02 Apr-07 Apr", price: "€\n9500" , join: "26 Peaple Joined.")

        
var Arrs: [PpListArr] = [
    Ar1,
    Ar2,
    Ar3,
    Ar4

]

struct PpList: View {
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            ForEach(Arrs, id: \.id) { i in
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 300, height: 160)
                    .foregroundColor(.white)
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 10, y: 0)
                    .overlay {
                        HStack(spacing: 0) {
                            Image("\(i.MainImage)")
                                .resizable()
                                .frame(width: 75, height: 130)
                                .cornerRadius(30)
                            
                            VStack(spacing: 30) {
                                HStack {
                                    VStack  {
                                        Text("\(i.title)")
                                            .bold()
                                        
                                        HStack {
                                            Image(systemName: "calendar")
                                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                                .font(.system(size: 10))
                                            
                                            Text("\(i.date)")
                                                .font(.system(size: 10))
                                        }
                                    }
                                    
                                    PriceView(price: i.price)
                                }
                                
                                HStack(spacing: 0) {
                                    StackedImages()
                                    
                                    Text("\(i.join)")
                                        .foregroundStyle(.gray)
                                        .font(.system(size: 10))
                                }
                            }
                        }
                    }
            }
            .padding()
        }
    }
}

#Preview {
    PpList()
}

struct PriceView: View {
    let price: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.red)
                .frame(width: 60)
            
            Text(price)
                .bold()
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
        }
    }
}

struct StackedImages: View {
    var body: some View {
        HStack {
            Image("manpic1")
                .resizable()
                .frame(width: 30, height: 30)
                .cornerRadius(20)
                .offset(x:20)
            
            Image("manorange")
                .resizable()
                .frame(width: 30, height: 30)
                .cornerRadius(20)
                .offset(x: 0)
            
            Image("manyell")
                .resizable()
                .frame(width: 30, height: 30)
                .cornerRadius(20)
                .offset(x: -20)
        }
    }
}
