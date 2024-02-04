//
//  BottList.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI
//
struct BottListArr: Identifiable {
    var id: UUID = UUID()
    var MainImage: String
    var title: String
    var location: String
    var date: String
    
}

var B1 : BottListArr = BottListArr(MainImage: "bhat", title: "Sea Beach", location: "Rangamati", date: "21 Feb-27 Feb")
var B2 : BottListArr = BottListArr(MainImage: "greenj", title: "Green Land", location: "Jordan", date: "08 Mar-12 Mar")

var AllBs: [BottListArr] = [
    B1,
    B2
]

let imageWidth: CGFloat = 270
let imageHeight: CGFloat = 140

struct BottList: View {
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            ForEach(AllBs, id: \.id) { i in
            
                ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 250)
                    .shadow(color: .gray.opacity(0.2), radius: 25, x: 10, y: 10)
                
                
               
                    
                    VStack{
                        Image("\(i.MainImage)")
                            .resizable()
                            .frame(width: imageWidth,
                                   height: imageHeight)
                            .cornerRadius(20)
                            .overlay {
                                ZStack {
                                    Circle()
                                        .frame(height: 35)
                                        .foregroundColor(.red)
                                    Image(systemName: "bookmark.fill")
                                        .resizable()
                                        .frame(width: 15, height: 17)
                                        .foregroundColor(.white)
                                }
                                .offset(x: imageWidth/2.5,
                                        y: imageHeight/2)
                            }
                        
                        VStack {
                            Text("\(i.title)")
                                .padding(.trailing,150)
                                .font(.system(size: 20))
                                .bold()
                        }
                        HStack {
                            Image(systemName: "location.circle.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("\(i.location)")
                                .font(.system(size: 15))
                                .foregroundColor(.black.opacity(0.7))
                            
                            Image(systemName: "calendar.circle.fill")
                                .resizable()
                                .frame(width: 15, height: 15)
                            Text("\(i.date)")
                                .font(.system(size: 15))
                                .foregroundColor(.black.opacity(0.7))
                        }
                        
                    }
                    
                }.padding()
            }.padding()
        }.padding()
    }
    
}
#Preview {
    BottList()
}
