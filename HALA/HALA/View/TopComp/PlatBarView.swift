//
//  PlatBarView.swift
//  HALA
//
//  Created by 10M on 22/07/1445 AH.
//

import SwiftUI

struct PlatBarView: View {
    
    
    var body: some View {
        HStack{
            
            RoundedRectangle(cornerRadius: 45)
                .frame(width: 350,height: 100)
                .foregroundColor(.white)
                .overlay {
          
                        HStack {
                            Image("H4")
                                .resizable()
                                .frame(width: 75,height: 75)
                            .clipShape(Circle())
                            VStack{
                                Text("Dusk till Dawn")
                                    .foregroundStyle(.black)
                                    .font(.title2)
                                    .bold()
                                
                                Text("Hala")
                                    .bold()
                                    .foregroundStyle(.black)
                                    .padding(.trailing,100)
                                    .opacity(0.5)
                            }
                            Spacer()
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                            Image(systemName: "pause.fill")
                            
                        }.padding()
                        
                        
                        
                    }
                    
                }.padding(.top,650)
            
        }
    }


#Preview {
    PlatBarView()
}
