//
//  FavoriteWAText.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct FavoriteWAText: View {
    var body: some View {
        ZStack{
            HStack(spacing: 40){
                Text("Favorite")
                .bold()
                .font(.system(size: 15))
                Text("Wallet")
                .font(.system(size: 15))
                .padding(.trailing)
                Text("About")
                .font(.system(size: 15))
            }
        }
    }
}

#Preview {
    FavoriteWAText()
}
