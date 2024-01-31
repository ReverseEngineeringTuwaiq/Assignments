//
//  FirstTryApp2.swift
//  swiftUItest
//
//  Created by Bushra Abuhaimed on 18/07/1445 AH.
//

import SwiftUI

struct FirstTryApp2: View {
    var body: some View {
        
        ZStack{
            
            Color.clear
            .ignoresSafeArea()
            
            VStack{
                
                VStack{
                    Text("Step 1/5")
                        .padding(.bottom, 100)
                        .foregroundStyle(.purple)
                        
                }
                
            
                Image("reg")
                    .resizable()
                    .frame(width: 220, height: 220)
                    .foregroundColor(.purple)
                
                Text("Registration")
                    //.padding(50)
                    .font(.title)
                    .bold()
            
                VStack {
                    Text("Enter your mobile number, we will send you OPT to verify later")
                        .multilineTextAlignment(.center)
                }.padding(40)
                
                
                VStack{
                    Image("no2")
                        .resizable()
                        .frame(width: 400, height: 70)
                        .foregroundColor(.purple)
                }.padding(.bottom,100)
                
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
    } // Body End
}//Struct End

#Preview {
    FirstTryApp2()
}
