//
//  FirstMsgChat.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 23/07/1445 AH.
//

import SwiftUI

struct FirstMsgChat: View {
    var body: some View {
        
        ZStack{
            
            UnevenRoundedRectangle(cornerRadii: .init(
                                                                topLeading: 50.0,
                                                                bottomLeading: 50.0,
                                                                bottomTrailing: 0.0,
                                                                topTrailing: 40.0),
                                                                style: .continuous)
                .frame(width: 300, height: 100)
                .foregroundStyle(.indigo)
            
//            Rectangle()
//                .foregroundColor(.indigo)
//                .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//                .cornerRadius(100)
            
            HStack(spacing:-80){
                
                VStack(alignment:.trailing){
                    Text("Hello Muhammad")
                        .foregroundStyle(.white)
                        .offset(x:40)
                    
                    Text("How are you doing?")
                        .foregroundStyle(.white)
                        .offset(x:40)
                }
                VStack(spacing: 40){
                    Image("manyell")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .trailing)
                        .cornerRadius(50)
                        .padding(.top,45)
                        .padding(.leading,140)
                        
                    
                    Text("10:05 AM")
                        .foregroundStyle(.gray)
                        .font(.system(size: 10))
                        .padding(.leading,140)
                        .offset(y: 1)
                        //.padding(.top,30)
                }
            }
        }
       
    }
}

#Preview {
    FirstMsgChat()
}