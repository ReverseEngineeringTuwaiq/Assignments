//
//  Recent.swift
//  HALA
//
//  Created by 10M on 22/07/1445 AH.
//

import SwiftUI

struct Recent: View {
    
    @ObservedObject var viewModel = SongsViewModel()

    var body: some View {
     
        VStack{
           
            
            ScrollView(.vertical , showsIndicators: false){
                ForEach(viewModel.AllSongs){ i in
                    HStack{
                        Image(i.photo)
                            .resizable()
                        .frame(width: 100,height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 27))
                        VStack(alignment: .leading){
                            Text(i.name)
                                .font(.system(size: 20))
                                .bold()
                            Text(i.artist)
                                .font(.title3)
                                .opacity(0.5)
                            
                        }
                        Spacer()
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .opacity(0.5)
                    }.padding()
                    
                }
                
                
            }
        }
    }
}

#Preview {
    Recent()
}
