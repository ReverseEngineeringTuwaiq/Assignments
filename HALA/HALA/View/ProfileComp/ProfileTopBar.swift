//
//  ProfileTopBar.swift
//  HALA
//
//  Created by 10M on 22/07/1445 AH.
//

import SwiftUI

struct ProfileTopBar: View {
    var body: some View {
    
        HStack{
            Image(systemName: "chevron.backward")
                .font(.title)
                .foregroundColor(.white)
                .bold()
            Spacer()
            HStack{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                    .frame(width: 100,height: 50)
                    .foregroundColor(.cyan)
                    .overlay {
                        
                                Text("Follow")
                                    .bold()
                                    .foregroundStyle(.white)
                                
                            }
                
                    
                        
                    }
                Text("⋮")
                    .font(.system(size: 50))
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.leading)
                    
                
            }.padding(.horizontal)
            .padding(.bottom,680)
            
            
            
        }
            
            
        
    }


#Preview {
    ProfileTopBar()
}
//RoundedRectangle(cornerRadius: 10)
//                            .frame(width: 95,height: 45)
//                            .foregroundColor(.cyan)
//                            .contrast(0.8)
//                            .overlay {
//
