//
//  ContentView.swift
//  Majed
//
//  Created by 10M on 18/07/1445 AH.
//

import SwiftUI
var count:Int = 0

struct ContentView: View {
    var body: some View {
            VStack{
                    
                    HStack{
                        VStack{
                        Text("Welcome to the")
                                .font(.system(size:40 ))
                                .bold()
                            .font(.title)
                            .foregroundStyle(.white)
                    
                            Text("iTunse Store")
                                .font(.system(size:40 ))

                                .bold()
                                .font(.title)
                                .foregroundStyle(.white)
                                
                        }                                 .padding(.bottom , 81 )


                }
                VStack{
                HStack{
                    Image(systemName: "music.note")
                        .padding()
                        .bold()
                        .font(.title)
                        .foregroundStyle(.blue)
                        
                    VStack{ Text("Get the Music You Want")
                            .padding(.trailing , 135)
                            .bold()
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text("Buy your favorite songs and albums from the world's largest music store.")
                            .foregroundStyle(.gray)
                            .font(.system(size: 13))

                    }
            
            }
                HStack{
                    Image(systemName: "film.fill")
                        .padding(8)
                        .bold()
                        .font(.title)
                        .foregroundStyle(.blue)
                        
                    VStack{ Text("Watch the Latest Movies")
                            .padding(.trailing , 125)
                            .bold()
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text("Buy your favorite songs and albums from the world's largest music store.")
                            .foregroundStyle(.gray)
                            .font(.system(size: 13))

                    }
            
                }
                    HStack{
                        Image(systemName: "tv.inset.filled")
                            .padding(8)
                            .bold()
                            .font(.title)
                            .foregroundStyle(.blue)
                        
                        VStack{ Text("Enjoy Ad-Free TV Shows")
                                .padding(.trailing , 125)
                                .bold()
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text("Buy individual episodes or entire seasons in HD and commercial-free.")
                                .font(.system(size: 13))
                            
                                .foregroundStyle(.gray)
                        }
                        
                    }

                 
                            
                }
                .padding(.bottom , 35 ) //here
                .padding(.top , 10 )
                VStack{
                    Image(systemName: "figure.2.and.child.holdinghands")
                        .padding(8)
                        .bold()
                        .font(.title)
                        .foregroundStyle(.blue)
                    Text("Your searches, browsing, purchases, and device trust score may be used to personalize your experience, send you notifications incloud for Apple markting, improve the iTunes Store and other Apple online stores, and prevent fraud")
                        .foregroundStyle(.gray)
                        .font(.system(size: 13))
                        .multilineTextAlignment(.center)
                    Text("See how your data is managed...")
                        .bold()
                        .foregroundStyle(.blue)
                        .font(.system(size: 10))
                }
                .padding(.top, 100)
                VStack{
                    Button("Continue") {
                    }
                    .frame(width: 320,height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    
                    .cornerRadius(8)
                    
                }                .padding(.top, 50)

                     }
            .ignoresSafeArea()
            .frame(maxWidth:.infinity,
                   maxHeight: .infinity)
        .background(.black
        )
        }
    
            
        }
        
    



#Preview {
    ContentView()
}
