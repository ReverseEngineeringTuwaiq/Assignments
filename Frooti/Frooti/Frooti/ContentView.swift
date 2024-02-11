//
//  ContentView.swift
//  Frooti
//
//  Created by 10M on 26/07/1445 AH.
//

import SwiftUI
 

struct ContentView: View {

    @StateObject var vm = CartViewModel()

    var body: some View {
        
            NavigationStack{
                
                
                ScrollView(.vertical){
            VStack {
                
                HStack{
                    
                    Image("Profile")
                        .resizable()
                        .frame(width: 70,height: 70)
                        .clipShape(Circle())
                    VStack(alignment: .leading){
                        Text("Good Morning 👋")
                            .padding(.trailing,30)
                            .opacity(0.5)
                            .font(.title2)
                        
                        Text("Majed")
                            .padding(.trailing)
                            .font(.title)
                            .bold()
                    }
                    Spacer()
                    Circle()
                        .frame(width: 50,height: 50)
                        .shadow(radius: 15)
                        .opacity(0.5)
                        .foregroundColor(.white)
                        .overlay {
                            NavigationLink(destination: SearchView()) {
                                Image(systemName: "magnifyingglass")
                                    .font(.title)
                                    .foregroundColor(.black)
                        }
                        }
                    
                } .padding(.horizontal)
                
                    listView(viewModel: FrtViewModel())
                    
                    
                    
                    
                    
                }.padding()
                }
            }
    }
}

#Preview {
    ContentView()
}
