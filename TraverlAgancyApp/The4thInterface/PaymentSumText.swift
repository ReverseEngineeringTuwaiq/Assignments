//
//  PaymentSumText.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct PaymentSumText: View {
    var body: some View {
        
        VStack{
            
            
            
            Text("Payment Summary")
                .padding(.trailing,210)
                .padding()
                .bold()
            //.padding()
            
            HStack(alignment:.center,spacing: 200){
                
                Text("Regular Price")
                Text("$40")
            }
            
            HStack(spacing: 187){
                Text("Transport Fees")
                Text("$30")
            }
            
            HStack(spacing: 170){
                Text("Hotel and Resort")
                Text("$25")
            }
            
            HStack(spacing: 250){
                Text("Others")
                Text("$40")
            }
            
            VStack{
                Rectangle()
                    .frame(width: 350, height: 2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                HStack(spacing: 210){
                    Text("Grand Total")
                        .bold()
                        .padding(.top)
                    Text("$135")
                        .bold()
                        .font(.system(size: 20))
                        .padding(.top)
                }
            }
        }
    }
}

#Preview {
    PaymentSumText()
}
