//
//  PayNowRec.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct PayNowRec: View {
    var body: some View {
        
        ZStack{
            
            Rectangle()
                .frame(width: 300, height: 60)
                .cornerRadius(40)
                .foregroundColor(.green)
            Text("Pay Now")
                .bold()
                .foregroundStyle(.white)
                .font(.system(size: 25))
        }
    }
}

#Preview {
    PayNowRec()
}
