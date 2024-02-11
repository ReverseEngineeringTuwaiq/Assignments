//
//  TopWeeklyView.swift
//  HALA
//
//  Created by 10M on 22/07/1445 AH.
//

import SwiftUI

struct TopWeeklyView: View {
    
    @ObservedObject var viewModel = SongsViewModel()

    var body: some View {
        ScrollView(.vertical){
        ForEach(viewModel.AllSongs){ i in
            
                HStack{
                    Image(i.photo)
                        .resizable()
                        .frame(width: 100,height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 27))
                    VStack{
                        HStack{
                            Text(i.name)
                                .bold()
                                .font(.system(size: 20))
                            Spacer()
                            
                            
                            Image(systemName: "play.circle.fill")
                                .opacity(0.5)
                                .font(.system(size: 20))
                            
                        }
                        HStack {
                            Text(i.artist)
                                .opacity(0.5)
                            Spacer()
                            Text(i.time)
                                .opacity(0.5)
                            
                        }
                    }
                    
                    
                }.padding(12)
                
            }
        }
    }
}

#Preview {
    TopWeeklyView()
}
