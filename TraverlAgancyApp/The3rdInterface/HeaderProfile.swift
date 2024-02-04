//
//  HeaderProfile.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct HeaderProfile: View {
    var body: some View {
        HStack{
            ZStack{
                Circle()
                    .foregroundColor(.gray.opacity(0.3))
                    .frame(width: 300, height: 50, alignment: .leading)
                
                Image(systemName: "arrowshape.backward.fill")
                    .font(.system(size: 21))
                    .foregroundColor(.gray)
                    .frame(width: 280, height: 50, alignment: .leading)
               

                Text("My Profile")
                    .bold()
                    .font(.system(size: 21))
                    .padding(.trailing,50)
                
                Circle()
                    .foregroundColor(.pink.opacity(0.3))
                    .frame(width: 50, height: 50, alignment:.trailing)
                    .padding(.leading,250)
                
                Image(systemName: "gearshape.fill")
                    .foregroundColor(.red)
                .font(.system(size: 23))
                .padding(.leading,250)
                   
                
            }
        }
        
    }
}

#Preview {
    HeaderProfile()
}
