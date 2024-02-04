//
//  Header.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 21/07/1445 AH.
//

import SwiftUI

struct Header: View {
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(.gray.opacity(0.3))
                .frame(width: 50, height: 50, alignment:.trailing)
                //.offset(x: -130 , y: -330)
                .frame(width: 300, height: 50, alignment: .leading)
            
            Image(systemName: "arrowshape.backward.fill")
                .font(.system(size: 21))
                .foregroundColor(.gray)
                .frame(width: 280, height: 50, alignment: .leading)
               // .offset(x: -130 , y: -330)
            
            Text("Popular Trip List")
                .bold()
                .font(.system(size: 21))
               // .offset(x: 3 , y: -330)
            
        }
    }
}


#Preview {
    Header()
}
