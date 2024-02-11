//
//  Header.swift
//  HALA
//
//  Created by 10M on 21/07/1445 AH.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "list.bullet.indent")
                    .font(.title)
                Spacer()
                Image("Profile")
                    .resizable()
                    .frame(width: 50,height: 50)
                    .clipShape(Circle())
                
            }.padding()
           
        }
    }
}

#Preview {
    Header()
}
