//
//  TopView.swift
//  HALA
//
//  Created by 10M on 22/07/1445 AH.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        
        ZStack{
            ScrollView(.vertical){
                HStack{
                    Image(systemName: "chevron.backward")
                        .font(.title)
                        .bold()
                    
                    Text("Top 100 Weekly")
                        .font(.title2)
                        .bold()
                        .padding(.leading,50)
                    Spacer()
                    Image(systemName: "ellipsis")
                    
                } .padding()
                
                SearchBarView()
                TopWeeklyView()
            }
        }.overlay {
            PlatBarView()
        }
    }
}

#Preview {
    TopView()
}
