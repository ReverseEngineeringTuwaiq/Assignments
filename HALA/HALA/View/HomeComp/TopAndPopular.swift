//
//  TopAndPopular.swift
//  HALA
//
//  Created by 10M on 21/07/1445 AH.
//

import SwiftUI

struct TopAndPopular: View {
    
    @ObservedObject var viewModel = SongsViewModel()
    
    var body: some View {
        VStack{
            
            HStack{
                
                RoundedRectangle(cornerRadius: 30.0)
                    .frame(width: .infinity,height: 150)
                    .padding(.horizontal)
                    .foregroundColor(.cyan)
                    .overlay {
                        
                        
                        Circle()
                            .scale(0.35)
                            .padding(.trailing,290)
                            .padding(.bottom,50)
                            .foregroundColor(.white)
                            .opacity(0.2)
                            .frame(width: .infinity,height: 150)
                            .overlay(content: {
                                Circle()
                                    .scale(1.9)
                                    .padding(.leading,200)
                                    .padding(.top,60)
                                    .foregroundColor(.white)
                                    .opacity(0.2)
                                    .frame(width: .infinity,height: 150)
                                
                            })
                        
                            .overlay {
                                HStack {
                                    VStack {
                                        Text("Top 100")
                                            .foregroundStyle(.white)
                                            .font(.title)
                                            .bold()
                                            .frame(width: .infinity,height: 30)
                                            .multilineTextAlignment(.leading)
                                            .padding(.trailing,200)
                                            .padding(.top)
                                        
                                        
                                        Text("Weekly")
                                            .foregroundStyle(.white)
                                            .font(.title)
                                            .bold()
                                            .frame(width: .infinity,height: 30)
                                            .multilineTextAlignment(.leading)
                                            .padding(.trailing,200)
                                    }
                                }
                                
                            } //Vstack END
                        
                        
                    } //HSTACK End
                
            }
            .padding(.vertical,20)
            HStack{
                
                Text("Popular Song")
                    .bold()
                    .font(.title)
                Spacer()
                Button("More"){}
            }.padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    
                    ForEach(viewModel.AllSongs){ i in
                        Image(i.photo)
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                            .frame(width: 180,height: 180)
                            .overlay {
                                Rectangle()
                                    .frame(width: 180,height: 90)
                                    .padding(.top,130)
                                    .opacity(0.3)
                                    .foregroundColor(.white)
                                    .overlay {
                                        VStack {
                                            HStack{
                                                
                                                Text(i.name)
                                        
                    .frame(minWidth: 5, idealWidth: 5, maxWidth: 170, alignment: .leading)
                                                    .font(.system(size: 20,weight:.heavy))
                                                    .foregroundColor(.white)
                                                    .bold()
                                                    .padding(.top,90)
                                                    .shadow(radius: 10)
                                                    .lineLimit(1)
                                                
                                            }
                                            
                                            Text(i.artist)
                .frame(minWidth: 5, idealWidth: 5, maxWidth: 170, alignment: .leading)
                                                    .font(.system(size:15,weight:.heavy))
                                                    .opacity(0.9)
                                                    .foregroundColor(.white)
                                                    .bold()
                                                    .shadow(radius: 10)
                                
                                        }.padding(.vertical)
                                    }
                            }
                        
                            }
                    }
                    
                }
            }
            
                } //Overlay END
        }
    


#Preview {
    TopAndPopular()
}
