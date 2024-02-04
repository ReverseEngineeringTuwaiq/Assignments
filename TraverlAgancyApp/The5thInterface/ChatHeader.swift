//
//  ChatHeader.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 23/07/1445 AH.
//

import SwiftUI

struct ChatHeader: View {
    var body: some View {
       
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(.white)
                .frame(width: 377, height: 100)
                .shadow(color: .gray.opacity(0.2), radius: 25, x: 10, y: 10)
            
            HStack{
                
                ZStack{
                    Circle()
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(width: 300, height: 50, alignment: .leading)
                    
                    Image(systemName: "arrowshape.backward.fill")
                        .font(.system(size: 21))
                        .foregroundColor(.gray)
                        .frame(width: 280, height: 50, alignment: .leading)
                    
                    Text("Muhammad")
                        .bold()
                  
                    ZStack{
                        Circle()
                            .foregroundColor(.pink.opacity(0.3))
                            .frame(width: 300, height: 50,alignment: .trailing)
                        
                        Image(systemName: "phone.badge.waveform.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 25))
                            .padding(.leading,250)
                        
                    }
                    
                    
                }
                
                
            }
        }
    }
}

#Preview {
    ChatHeader()
}
