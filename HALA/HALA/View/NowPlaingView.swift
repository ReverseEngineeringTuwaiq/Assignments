//
//  NowPlaingView.swift
//  HALA
//
//  Created by 10M on 22/07/1445 AH.
//

import SwiftUI

struct NowPlaingView: View {
    
    @State var like: Bool = false
    @State var isPlay: Bool = false
    @State private var drawingWidth = false

      let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
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
                .padding(.vertical,20)
        
            Image("H9")
                .resizable()
                .frame(width: 300,height: 300)
                .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
            HStack {
                Text("             ")
                Spacer()
                
                VStack{
                   
                    Text("راجعين يا هوى")
                        .bold()
                        .font(.title)
                        .padding(.bottom,3)
                    Text("فيروز")
                        .opacity(0.5)
                }
                Spacer()
                
                Image(systemName: "heart.fill")
                    .foregroundColor(like == false ? .gray : .red)
                    .font(.title)
                    .overlay {
                        Button(" "){
                            like.toggle()
                        }
                    }
                
            }.padding()
            Spacer()
            
            
            
            VStack(alignment: .leading) {
                       ZStack(alignment: .leading) {
                           RoundedRectangle(cornerRadius: 6)
                               .fill(Color(.systemGray6))
                           RoundedRectangle(cornerRadius: 6)
                               .fill(.cyan)
                               .frame(width: drawingWidth ? 300 : 0, alignment: .leading)
                               .animation(.easeInOut(duration: 10)
                                .repeatForever(autoreverses: false), value: drawingWidth)
                       }
                       .frame(width: 300, height: 10)
                       .onAppear {
                           drawingWidth.toggle()
                       }
                   }
            
            Spacer()
            
            
            
        }
        
        HStack{
            
            Image(systemName: "shuffle")
                .font(.title)
                .opacity(0.5)
            Spacer()
            Image(systemName: "backward.end.fill")
                .font(.title)
            Spacer()

            if isPlay == false{
                
                Circle()
                    .frame(width: 70,height: 70)
                    .foregroundColor(.gray)
                    .overlay {
                        
                        
                        
                        Image(systemName: "play.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.black )
                            .overlay {
                                Button(" "){
                                    isPlay.toggle()
                                }.frame(width: 70,height: 70)
                            }
                    }
            }else{
                
                Circle()
                    .frame(width: 70,height: 70)
                    .foregroundColor(.cyan)
                    .overlay {
                        
                        
                        
                        Image(systemName: "play.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.white )
                            .overlay {
                                Button(" "){
                                    isPlay.toggle()
                                }.frame(width: 70,height: 70)
                            }
                    }
            }

            Spacer()
            Image(systemName: "forward.end.fill")
                .font(.title)
            Spacer()
            Image(systemName: "repeat")
                .font(.title)
                .opacity(0.5)
            
            
            
        }.padding(.horizontal)
            .padding(.vertical,20)
            Spacer()
            
        VStack(alignment: .center){
            
            Image(systemName: "chevron.up")
                .font(.title)
                .fontWeight(.light)
                .opacity(0.5)
            Text("Lyrics")
        }
    }
}

#Preview {
    NowPlaingView()
}
