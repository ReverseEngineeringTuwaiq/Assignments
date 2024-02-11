//
//  SearchBarView.swift
//  HALA
//
//  Created by 10M on 22/07/1445 AH.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .frame(width: .infinity,height: 60)
                .opacity(0.1)
                .foregroundColor(.gray)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .overlay {
                    HStack{
                        
                       
                        Text("Search...")
                            .bold()
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .opacity(0.3)
                            .font(.title)
                        
                    } .padding(.horizontal)
                    
                }
        }.padding(.horizontal)    }
}

#Preview {
    SearchBarView()
}
