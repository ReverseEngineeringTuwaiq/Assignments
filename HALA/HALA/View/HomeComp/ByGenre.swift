//
//  ByGenre.swift
//  HALA
//
//  Created by 10M on 21/07/1445 AH.
//

import SwiftUI

struct ByGenre: View {
    
    @ObservedObject var viewModelll = GenreViewModel()
    
    var body: some View {
        VStack {
            HStack{
                
                Text("By Genre")
                    .bold()
                    .font(.title)
                Spacer()
                Button("More"){}
            }.padding(.horizontal)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    
                    
                    ForEach(viewModelll.TopGenre){ i in
                        Image(i.phot)
                            .resizable()
                            .frame(width: 150,height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .blur(radius: 0.5)
                            .overlay {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .opacity(0.5)
                                    .padding(.top,90)
                                    .overlay {
                                        Text(i.title)
                                            .font(.system(size: 30))
                                            .foregroundStyle(.black)
                                            .bold()
                                            .padding(.top,75)
                                            .shadow(radius: 10)
                                        
                                    }
                            }
                    }
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    
                    
                    ForEach(viewModelll.MidGenre){ i in
                        Image(i.phot)
                            .resizable()
                            .frame(width: 150,height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .blur(radius: 0.5)
                            .overlay {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .opacity(0.5)
                                    .padding(.top,90)
                                    .overlay {
                                        Text(i.title)
                                            .font(.system(size: 30))
                                            .foregroundStyle(.black)
                                            .bold()
                                            .padding(.top,75)
                                            .shadow(radius: 10)
                                        
                                    }
                            }
                    }
                }
            }.padding(.vertical)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    
                    
                    ForEach(viewModelll.LastGenre){ i in
                        Image(i.phot)
                            .resizable()
                            .frame(width: 150,height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .blur(radius: 0.5)
                            .overlay {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .opacity(0.5)
                                    .padding(.top,90)
                                    .overlay {
                                        Text(i.title)
                                            .font(.system(size: 30))
                                            .foregroundStyle(.black)
                                            .bold()
                                            .padding(.top,75)
                                            .shadow(radius: 10)
                                        
                                    }
                            }
                    }
                }
            }
            
                }
                
            }

                
            }
        
    


#Preview {
    ByGenre()
}
