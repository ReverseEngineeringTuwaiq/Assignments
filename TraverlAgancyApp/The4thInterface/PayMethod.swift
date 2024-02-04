//
//  PayMethod.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct PayMethod: View {
    var body: some View {
        
        HStack(spacing: 130){
            Text("Payment Method")
                .bold()
            Text("Add more")
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    PayMethod()
}
