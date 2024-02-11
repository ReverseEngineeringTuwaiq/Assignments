//
//  destView.swift
//  MyDbApp
//
//  Created by 10M on 25/07/1445 AH.
//

import SwiftUI

struct destView: View {
    var body: some View {
        ZStack{
            
            VStack {
                VStack {
                    Circle()
                        .frame(width: 100,height: 100)
                        .opacity(0.1)
                        .foregroundColor(.black)
                        .overlay { Text("a" )
                    }
                    
                    Text("ii.name").font(.largeTitle)
                        .bold()
                    Rectangle().frame(height: 100).opacity(0.1).overlay {
                        VStack{
                            Text("Mobile").bold()
                                .font(.title2)
                                .padding(.vertical,1)
                            Text("aaaaaaaa").padding(.leading,60).frame(width: 300)
                        }.padding(.trailing,310).padding(.bottom,25)
                    }
                    
                    
                    
                }
                Rectangle().frame(height: 100).opacity(0.1).overlay {

                VStack{
                    Text("Email").bold()
                        .padding(.trailing,310)
                        .font(.title2)
                        .padding(.vertical,1)
                    Text("ii.email").frame(width: 300).foregroundStyle(.blue)
                }.padding(.bottom,25)}
                
               
            }
            
            
            
        }
    }
}

#Preview {
    destView()
}
