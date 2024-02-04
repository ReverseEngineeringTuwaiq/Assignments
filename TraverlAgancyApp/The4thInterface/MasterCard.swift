//
//  MasterCard.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct MasterCard: View {
    var body: some View {
        
        
        ZStack{
            
            VStack{
                
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 120)
                        .shadow(color: .gray.opacity(0.2), radius: 25, x: 10, y: 10)
                    
                    
                    HStack(spacing: 20){
                        
                        ZStack{
                            Circle()
                                .stroke(.red, lineWidth: 5)
                                .fill(.white)
                                .frame(width: 35, height: 35)
                            
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.red)
                        }
                        
                        VStack(alignment:.leading,spacing: 18){
                            
                            Text("MasterCard")
                                .bold()
                            Text("XXX XXX XXX 7845")
                                .foregroundStyle(.gray)
                            
                        }
                        
                        VStack(spacing: 13){
                            
                            HStack(spacing:-13){
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.red)
                                
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.orange)
                            }
                            
                            Text("09/27")
                                .foregroundStyle(.gray)
                                .font(.system(size: 15))
                            
                        }
                    }
                }
                
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 120)
                        .shadow(color: .gray.opacity(0.2), radius: 25, x: 10, y: 10)
                    
                    
                    HStack(spacing: 20){
                        
                        ZStack{
                            Circle()
                                .stroke(.gray, lineWidth: 5)
                                .fill(.white)
                                .frame(width: 35, height: 35)
                            
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment:.leading,spacing: 18){
                            
                            Text("Paypal")
                                .bold()
                            Text("XXX XXX XXX 7845")
                                .foregroundStyle(.gray)
                            
                        }
                        
                        VStack(spacing: 13){
                            
                            HStack(spacing:-13){
                                
                                Image("paypal")
                                    .resizable()
                                    .frame(width: 30, height: 30)
//                                Circle()
//                                    .frame(width: 30, height: 30)
//                                    .foregroundColor(.red)
//                                
//                                Circle()
//                                    .frame(width: 30, height: 30)
//                                    .foregroundColor(.orange)
                            }
                            
                            Text("09/27")
                                .foregroundStyle(.gray)
                                .font(.system(size: 15))
                            
                        }
                    }
                    
                }
                
            }
        }
        
        
    }
    
    
}

#Preview {
    MasterCard()
}
