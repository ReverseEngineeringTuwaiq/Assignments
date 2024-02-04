//
//  TheMainInterfac5.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 23/07/1445 AH.
//

import SwiftUI

struct TheMainInterfac5: View {
    var body: some View {
       
        
        ChatHeader()
        FirstMsgChat()
        SecMsgChat()
            .padding(.trailing,85)
        ThirdMsgChat()
        ForthMsgChat()
        BottBar()
    }
}

#Preview {
    TheMainInterfac5()
}
