//
//  TheMainInterface2.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 21/07/1445 AH.
//

import SwiftUI

struct TheMainInterface2: View {
    var body: some View {
        
        
        
        
        
        ScrollView(showsIndicators: false){
            Header()
            .padding()
            Spacer()
            PpList()
                

        }
        
        
    }
}

#Preview {
    TheMainInterface2()
}
