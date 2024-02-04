//
//  ProfilePicAndName.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct ProfilePicAndName: View {
    var body: some View {
        ZStack{
            VStack{
                Image("manpic1")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .cornerRadius(50)
                VStack(spacing : 0){
                    Text("Basmi Beyrek")
                        .bold()
                        .font(.title2)
                    
                    //prem text and icon
                    HStack{
                        Image("prem")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .leading)
                        
                        Text("Premium Member")
                            .foregroundStyle(.gray)
                            .font(.system(size: 13))
                        
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ProfilePicAndName()
}
