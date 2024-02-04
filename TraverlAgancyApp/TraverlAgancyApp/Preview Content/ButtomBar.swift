//
//  ButtomBar.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 21/07/1445 AH.
//

import SwiftUI

struct ButtomBar: View {
    var body: some View {
        
        
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 350, height: 70, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .shadow(color: .gray.opacity(0.2), radius: 9, x: 0, y: -3)
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.green)
                .frame(width: 100, height: 45, alignment:.leading)
                .padding(.trailing,180)
            
            Image(systemName: "house.fill")
                .foregroundColor(.white)
                .font(.system(size: 23))
                .padding(.trailing,235)
            
            Text("Home")
                .foregroundStyle(.white)
                .padding(.trailing,155)
                .padding(.top,1)
            
            Image(systemName: "bookmark.fill")
                .font(.system(size: 21))
                .foregroundColor(.black)
                .opacity(0.6)
            
            Image(systemName: "bell.badge.fill")
                .font(.system(size: 21))
                .padding(.leading,135)
                .foregroundColor(.black)
                .opacity(0.6)
            
            Image(systemName: "person.fill")
                .font(.system(size: 21))
                .padding(.leading,250)
                .foregroundColor(.black)
                .opacity(0.6)
            
            
            
            
                
        }
    }
}

#Preview {
    ButtomBar()
}
