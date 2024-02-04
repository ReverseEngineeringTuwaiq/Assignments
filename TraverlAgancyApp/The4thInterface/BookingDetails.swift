//
//  BookingDetails.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct BookingDetails: View {
    var body: some View {
        
        ZStack{
            
            HStack(spacing: 110){
                
                Text("Booking Details")
                    .bold()
                    .font(.system(size: 21))
                
                Text("Change")
                    .foregroundStyle(.gray)
                
                
            }
        }
        
    }
}

#Preview {
    BookingDetails()
}
