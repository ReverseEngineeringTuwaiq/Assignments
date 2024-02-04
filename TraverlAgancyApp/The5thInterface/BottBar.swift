//
//  BottBar.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 23/07/1445 AH.
//

import SwiftUI

struct BottBar: View {
    var body: some View {
        
        
        ZStack{
            
            HStack(spacing:140){
                
                Text("Type here")
                    .foregroundStyle(.gray)
              
                ZStack{
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.pink).opacity(0.3)
                    Image(systemName: "location.circle.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 30))
                }
            }
            
        }
        
    }
}

#Preview {
    BottBar()
}
