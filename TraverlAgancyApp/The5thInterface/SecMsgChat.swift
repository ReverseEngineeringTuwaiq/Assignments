//
//  SecMsgChat.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 23/07/1445 AH.
//

import SwiftUI

struct SecMsgChat: View {
    var body: some View {
      
        
        ZStack{
            
            UnevenRoundedRectangle(cornerRadii: .init(
                                                                topLeading: 0.0,
                                                                bottomLeading: 50.0,
                                                                bottomTrailing: 50.0,
                                                                topTrailing: 40.0),
                                                                style: .continuous)
                .frame(width: 250, height: 80)
                .foregroundStyle(.gray.opacity(0.2))
            
          
            HStack(spacing:-160){
                
                VStack(spacing: 20){
                    Image("manpic2")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .trailing)
                        .cornerRadius(50)
                        .padding(.top,35)
                        .padding(.trailing,200)
                        //.padding(.bottom)
                        
                    
                    Text("10:14 AM")
                        .frame(width: 100)
                        .foregroundStyle(.gray)
                        .font(.system(size: 10))
                        .padding(.trailing,200)
                        //.padding(.top,30)
                }
                
                Text("Hey, I'm good.")
                    //.padding(.trailing,100)
                    .offset(x:-50)
                    
            }
        }
        
    }
}

#Preview {
    SecMsgChat()
}
