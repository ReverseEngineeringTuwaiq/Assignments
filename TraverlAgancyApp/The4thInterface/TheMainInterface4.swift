//
//  TheMainInterface4.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct TheMainInterface4: View {
    var body: some View {
        
        
        
        ScrollView(showsIndicators: false){
            Spacer()
            BookingHeader()
            BookingDetails()
                .padding()
            Spacer()
            ListOfBooking2()
            PaymentSumText()
            Spacer()
                .padding()
            PayMethod()
            MasterCard()
                .padding()
            PayNowRec()
            
            
        }
        
        
    }
}

#Preview {
    TheMainInterface4()
}
