//
//  Headerbar.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 20/07/1445 AH.
//

import SwiftUI

struct Headerbar: View {
    var body: some View {
        
        HStack{
            ZStack {
                Image("left A")
                    .resizable()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(width: 30, height: 30, alignment: .leading)
                    .font(.system(size: 25))
                    .padding(.horizontal)
                
                Circle()
                    .fill(.clear)
                    .strokeBorder(.gray.opacity(0.5))
                    .frame(width: 50, height: 50, alignment:.leading)
                    .padding(.horizontal)
                
                
            }
            
            
            
            Text("Home")
                .bold()
                .padding(.trailing,100)
            
            
            Spacer()
            
            Image("manpic1")
                .resizable()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(width: 50, height: 50, alignment: .leading)
                .font(.system(size: 25))
                .cornerRadius(30)
                .padding(.trailing,30)
            
            
        }
    }
    
}

#Preview {
    Headerbar()
}
