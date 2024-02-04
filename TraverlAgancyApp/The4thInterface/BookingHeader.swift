//
//  BookingHeader.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct BookingHeader: View {
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
               

                Text("Booking")
                    .bold()
                    .font(.system(size: 21))
                    .padding(.trailing,50)
                
                
                   
                
            }
        }
    }
}

#Preview {
    BookingHeader()
}
