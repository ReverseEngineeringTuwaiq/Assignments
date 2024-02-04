//
//  SocialMediaIcons.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct SocialMediaIcons: View {
    var body: some View {
        
        ZStack{
            HStack(spacing : 40){
                Image("fb")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                Image("insta")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                Image("linked")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
    }
}

#Preview {
    SocialMediaIcons()
}
