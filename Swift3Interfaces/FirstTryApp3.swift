//
//  FirstTryApp3.swift
//  swiftUItest
//
//  Created by Bushra Abuhaimed on 19/07/1445 AH.
//

import SwiftUI

struct FirstTryApp3: View {
    var body: some View {
        ZStack{
            
            Color.clear
            .ignoresSafeArea()
            
            VStack{
                
                VStack{
                    Text("Step 2/5")
                        .padding(.bottom, 100)
                        .foregroundStyle(.purple)
                        
                }
                
            
                Image("nn1")
                    .resizable()
                    .frame(width: 220, height: 220)
                    .foregroundColor(.purple)
                
                Text("Verification")
                    //.padding(50)
                    .font(.title)
                    .bold()
            
                VStack {
                    Text("Enter 4 digit number that sent to ..")
                        .multilineTextAlignment(.center)
                }.padding(40)
                
//                VStack{
//
//                    Rectangle()
//                        .frame(width: 400,height: 100)
//                        .foregroundColor(.gray)
//
//                }
                
                VStack{
                    Image("qq")
                        .resizable()
                        .frame(width: 350, height: 150)
                        .foregroundColor(.purple)
                }.padding(.bottom,30)
                
                Button(action: {}) {
                    Text("Continue")
                        .padding()
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .background(.purple)
                        .cornerRadius(16)
                        .padding(.horizontal)
                }
            
        } // VStack End
        } // ZStack End
    }
}

#Preview {
    FirstTryApp3()
}
