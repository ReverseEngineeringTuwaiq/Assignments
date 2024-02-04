//
//  TextCenter.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 21/07/1445 AH.
//

import SwiftUI

struct TextCenter: View {
    var body: some View {
        HStack{
            
            
            Text("Travel Agancy.")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.trailing,50)
            Text("See All")
                .padding()
        }
    }
        
}

#Preview {
    TextCenter()
}
