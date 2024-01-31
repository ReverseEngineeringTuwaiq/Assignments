//
//  FirstTryApp.swift
//  swiftUItest
//
//  Created by Bushra Abuhaimed on 18/07/1445 AH.
//

import SwiftUI

struct FirstTryApp: View {
    var body: some View {
        
        ZStack {
        
            Color.clear
            .ignoresSafeArea()
            
        VStack{
            
            
            
            VStack {
                Image("oone")
                    .resizable()
                    .frame(width: 220, height: 220)
                    .foregroundColor(.purple)
                
                Text("Let's get started")
                    .padding(50)
                    .font(.title)
                    .bold()
                    
                
                Text("Welocm!, and join us ")
                    .foregroundStyle(.gray)
                    .font(.system(size: 20))
                    .padding()
                    
                
            }.padding(.vertical, 100)
                
            VStack{
                Image(systemName: "ellipsis")
                    .padding(.bottom,20)
                    .foregroundColor(.purple)
                    .font(.system(size: 50))
            }
            
            Button(action: {}) {
                Text("Craete Account")
                    .padding()
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .background(.purple)
                    .cornerRadius(16)
                    .padding(.horizontal)
            }
            
            Button(action: {}) {
                Text("Login")
                    .padding()
                    .foregroundColor(.purple)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .border(.purple)
                    .cornerRadius(16)
                    .padding(.horizontal)
            }
                    
                   
                
            
            
            
            
        }// main VStack end
    }// ZStack End
}
}

#Preview {
    FirstTryApp()
}
