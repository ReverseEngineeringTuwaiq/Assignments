//
//  TheMainInterface.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 21/07/1445 AH.
//

import SwiftUI

struct TheMainInterface: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            
            Spacer()
            Headerbar()
            Spacer()
            SearchBarAndFilter()
            Spacer()
            PpText()
            .padding(.bottom,-30)
            Spacer()
            PopularTrip()
            .frame(width: 400, height: 370)
            TextCenter()
            .padding(.bottom,-90)
            PopularTrip2()
            .frame(width: 400, height: 370)
            ButtomBar()
            
        }
    }
}
#Preview {
    TheMainInterface()
}
