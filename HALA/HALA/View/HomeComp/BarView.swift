//
//  BarView.swift
//  HALA
//
//  Created by 10M on 22/07/1445 AH.
//

import SwiftUI

struct BarView: View {
    
    @State var isMain: Bool = false
    @State var isSearch: Bool = false
    @State var isFav: Bool = false
    @State var isPlay: Bool = false
    
    var body: some View {
        ZStack {
            

            
            HStack{
                RoundedRectangle(cornerRadius: 40)
                    .frame(width: .infinity , height: 90)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .opacity(0.8)
                    .overlay {
                        HStack{
                            Spacer()
                            VStack{
                                Image(systemName: "music.quarternote.3")
                                    .foregroundColor(isMain == false ? .black :.blue)
                                    .font(.system(size: isMain == false ? 25 : 30))
                                    .padding(.vertical,3)
                                Text("Main")
                                    .foregroundColor(isMain == false ? .black :.blue)
                                    .bold()
                            }.overlay {
                                Button(" "){
                                    isMain.toggle()                            }
                                
                            }
                            Spacer()
                            VStack{
                                Image(systemName: "magnifyingglass")
                                    .bold()
                                    .foregroundColor(isSearch == false ? .black :.blue)
                                    .font(.system(size: isSearch == false ? 25 : 30))
                                    .padding(.vertical,3)
                                Text("Search")
                                    .foregroundColor(isSearch == false ? .black :.blue)
                            }
                            .overlay {
                                Button(" "){
                                    isSearch.toggle()
                                                            }
                                
                                
                            }
                            Spacer()
                            VStack{
                                Image(systemName: "heart")
                                    .bold()
                                    .foregroundColor(isFav == false ? .black :.blue)
                                    .font(.system(size: isFav == false ? 25 : 30))
                                    .padding(.vertical,3)
                                Text("Favorites")
                                    .foregroundColor(isFav == false ? .black :.blue)
                                    
                            }.overlay {
                                Button(" "){
                                    isFav.toggle()
                                                            }
                                
                            }
                            Spacer()
                            VStack{
                                Image(systemName: "music.note.list")
                                    .bold()
                                    .foregroundColor(isPlay == false ? .black :.blue)
                                    .font(.system(size: isPlay == false ? 25 : 30))
                                    .padding(.vertical,3)
                                Text("Playlist")
                                    .foregroundColor(isPlay == false ? .black :.blue)
                                    
                            }.overlay {
                                Button(" "){
                               
                                    isPlay.toggle()
                                }
                                
                            }
                            Spacer()
                        }
                    }
            }
        }
        .padding(.top,650)
    }
}
#Preview {
    BarView()
}
