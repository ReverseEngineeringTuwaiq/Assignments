//
//  listView.swift
//  Frooti
//
//  Created by 10M on 26/07/1445 AH.
//

import SwiftUI

struct listView: View {

    @StateObject var viewModel = FrtViewModel()

    var body: some View {
        ScrollView(.vertical){
            VStack {
                
                HStack{
                    Text("Top Products")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                    
                        NavigationLink(destination: ShowList()) {
                            Text("View All")
                    }
                }.padding()
                
                gridView()
                
            }.onAppear{
                viewModel.readAll()
            }
            
        }
        }
    }


#Preview {
    listView()
}
