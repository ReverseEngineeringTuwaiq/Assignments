//
//  PpText.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 21/07/1445 AH.
//

import SwiftUI

struct PpText: View {
    var body: some View {
        VStack{
            Text("Popular Trip.")
                .font(.system(size: 25))
                .frame(alignment:.leading)
                .frame(width: .infinity)
                .padding(.trailing,145)
                .bold()
                .font(.title)
        }
    }
}

#Preview {
    PpText()
}
