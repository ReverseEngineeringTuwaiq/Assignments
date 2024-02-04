//
//  ThirdMsgChat.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 23/07/1445 AH.
//

import SwiftUI

struct ThirdMsgChat: View {
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
            
            HStack(spacing:-90){
                
                VStack(alignment:.leading){
                    Text("I need some information\n about the tour.")
                        .foregroundStyle(.white)
                        .offset(x:25)
                    
//                    Text("How are you doing?")
//                        .foregroundStyle(.white)
//                        .offset(x:40)
                }
                VStack(spacing: 40){
                    Image("manyell")
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .trailing)
                        .cornerRadius(50)
                        .padding(.top,45)
                        .padding(.leading,140)
                        .offset(x:-15)
                        
                    
                    Text("10:15 AM")
                        .foregroundStyle(.gray)
                        .font(.system(size: 10))
                        .padding(.leading,140)
                        //.padding(.top,30)
                }
            }
        }
       
    }
        
    }


#Preview {
    ThirdMsgChat()
}
