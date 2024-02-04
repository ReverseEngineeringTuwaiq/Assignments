//
//  TheMainInterface3.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct TheMainInterface3: View {
    var body: some View {
        
        ScrollView(showsIndicators: false){
            Spacer()
            HeaderProfile()
            ProfilePicAndName()
                .padding()
            SocialMediaIcons()
                .padding()
            FavoriteWAText()
            TheSmallRedRec()
            BottList()
        }
    }
}

#Preview {
    TheMainInterface3()
}
