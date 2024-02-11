//
//  SearchView.swift
//  HALA
//
//  Created by 10M on 22/07/1445 AH.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack{
            ScrollView{
                HStack{
                    Image(systemName: "chevron.backward")
                        .font(.title)
                        .bold()
                    
                    Text("Search")
                        .font(.title)
                        .bold()
                        .padding(.leading,100)
                    
                }  .padding(.trailing,100)
                    .padding(.vertical)
                SearchBarView()
                HStack{
                    Text("Recent Searches")
                        .foregroundStyle(.blue)
                        .bold()
                        .padding(.trailing,200)
                        .padding(.bottom)
                }            .padding(.top,10)
                
                Recent()
            }
        }.overlay {
            BarView()
        }
    }
}

#Preview {
    SearchView()
}
