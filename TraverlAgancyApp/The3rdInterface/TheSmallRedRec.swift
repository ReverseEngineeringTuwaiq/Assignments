//
//  TheSmallRedRec.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct TheSmallRedRec: View {
    var body: some View {
        
        
        
       Rectangle()
            .cornerRadius(5)
            .frame(width: 40, height: 10)
            .foregroundColor(.red)
            .padding(.trailing,182)
            .padding(.bottom)
        
        
        
    }
}

#Preview {
    TheSmallRedRec()
}
