//
//  SearchBarAndFilter.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 21/07/1445 AH.
//

import SwiftUI

struct SearchBarAndFilter: View {
    var body: some View {
        
        HStack{
            ZStack{
                Rectangle()
                    .frame(width: 200, height: 45, alignment: .leading)
                    .cornerRadius(50)
                    .foregroundColor(.gray)
                    .opacity(0.2)
                
                Image(systemName: "magnifyingglass.circle.fill")
                    .foregroundColor(.black)
                    .opacity(0.6)
                    .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .font(.system(size: 40))
                    .padding(.trailing,99)
                
            }
            
            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .trailing)
                .padding(.leading)
            
            
            
        }
        
        
    }
}

#Preview {
    SearchBarAndFilter()
}
