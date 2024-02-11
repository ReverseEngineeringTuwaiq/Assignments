//
//  ProfileView.swift
//  HALA
//
//  Created by 10M on 22/07/1445 AH.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel = SongsViewModel()

    var body: some View {
      
       
            ZStack {
                
                
                LinearGradient(colors: [.cyan,.black], startPoint: .topLeading, endPoint: .bottomTrailing)
                
                ScrollView(.vertical){
                VStack{
                    
                    
                    
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: .infinity,height: 1250)
                        .padding(.top,300)
                        .foregroundColor(.white)
                        .overlay {
                            VStack{
                                Image("Profile")
                                    .resizable()
                                    .frame(width: 250,height: 250)
                                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                
                                Text("Majed")
                                    .font(.title)
                                    .bold()
                                    .padding(.top)
                                Text("1000000 Monthly Listeners")
                                    .opacity(0.5)
                                
                                HStack{
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 200,height: 60)
                                        .foregroundColor(.cyan)
                                        .overlay {
                                            HStack{
                                                Image(systemName: "play.fill")
                                                    .foregroundColor(.white)
                                                    .bold()
                                                
                                                Text("Play All")
                                                    .bold()
                                                    .foregroundStyle(.white)
                                                    .fontWeight(.heavy)
                                            }
                                        }
                                    
                                    Image(systemName: "shuffle.circle")
                                        .font(.system(size: 50))
                                        .foregroundColor(.cyan)
                                        .fontWeight(.light)
                                    
                                    
                                    
                                    
                                }
                                
                                
                                Text("Popular Songs")
                                    .foregroundStyle(.cyan)
                                    .padding(.trailing,250)
                                    .padding(.top,20)
                                
                                
                                ForEach(viewModel.AllSongs){i in
                                    HStack{
                                        
                                        Text("♫")
                                            .font(.system(size: 40))
                                            .bold()
                                            .foregroundStyle(.cyan)
                                        
                                        
                                        Image("music.note")
                                            
                                        VStack{
                                            Text(i.name)
                                                .bold()
                                                .font(.title3)
                                                .padding(.trailing,100)
                                                .lineLimit(1)
                                                .foregroundStyle(.black)
                                            
                                            Text("Song • Majed")
                                                .opacity(0.5)
                                                .padding(.trailing,100)
                                                .lineLimit(1)
                                                .foregroundStyle(.black)
                                        }
                                        Spacer()
                                        Text("⋮")
                                            .font(.system(size: 40))
                                            .foregroundStyle(.black)
                                        
                                    }.padding(.horizontal)
                                }
                                
                                
                            }.padding(.top,100)
                        }
                    
                    
                    
                    
                    
                    
                }
                
            }
        }.edgesIgnoringSafeArea(.all)
            .overlay {
                ProfileTopBar()
                PlatBarView()
            }
    }
}

#Preview {
    ProfileView()
}
