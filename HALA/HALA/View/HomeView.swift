//
//  HomeView.swift
//  HALA
//
//  Created by 10M on 21/07/1445 AH.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
       
        ZStack{
        ScrollView(.vertical, showsIndicators: false){
           
            
            VStack {
                Header()
                SearchBarView()
                TopAndPopular()
                ByGenre()
                
                
            }
                }
        }.overlay {
            BarView()
        }
    }
}

#Preview {
    HomeView()
}
