//
//  SheetView.swift
//  Frooti
//
//  Created by 10M on 27/07/1445 AH.
//

import SwiftUI

struct SheetView: View {
    
     var Name: String
     var Desc: String
     var prc: String
     var pics: String
    
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(colors: [.pink,.white], startPoint: .topLeading, endPoint: .bottomTrailing).opacity(0.3)
            
            
            VStack {
                
                
                AsyncImage(url: URL(string: pics)) { image in
                    image.resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .scaledToFit()
                        .padding(.bottom, 350)
                        .ignoresSafeArea()
                        .overlay {
                            VStack {
                                
                                Text(" \(Name)")
                                    .bold()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.system(size: 60))
                                    .padding(.top,235)
                                
                                VStack(alignment: .leading) {
                                    Text("\(Desc)")
                                        .font(.title2)
                                }.padding()
                                    .frame(maxWidth: .infinity)
                                    Spacer()
                                HStack{
                                    Spacer()
                                    Text("$ \(prc)")
                                        .bold()
                                        .font(.title)
                                }.padding()
                                Spacer()
                                
                            }.padding(.top, 150)
                            Spacer()
                        }
                    
                    
                } placeholder: {
                    ProgressView()
                }
                
            }.padding(.bottom,50)
        }.ignoresSafeArea()

    }
}

#Preview {
    SheetView(Name: "AAA", Desc: "Aaajghfvkyujsgfisuyejgfbshfs", prc: "42", pics: "https://wrkyyersgqlfzfmjyycj.supabase.co/storage/v1/object/public/pics/strwb%20(1).jpg")
}
