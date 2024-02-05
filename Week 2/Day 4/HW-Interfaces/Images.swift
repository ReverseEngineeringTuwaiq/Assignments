//
//  Images.swift
//  HW-Interfaces
//
//  Created by istabraq on 20/07/1445 AH.
//

import SwiftUI

struct Images: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    image11
                    image12
                    image13
                    image11
                    image12
                    
                }
                .frame(height: 300)
            }
        }    }
}
var image11: some View {
    ZStack {
        // Image
        Image("Villa-image")
            .resizable()
            .frame(width: 200, height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding()
        
        // Overlay views
        VStack {
            Spacer()
            VStack(alignment: .leading) {
                Text("Modernica Apartme...")
                    .bold()
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text("New York. US")
                    .font(.caption2)
                    .foregroundStyle(.white)
            }.padding(.horizontal)
            
            
            HStack {
                HStack{
                    Text("$29")
                        .bold()
                        .font(.caption2)
                        .foregroundStyle(.white)
                        .frame(width: 70)
                    
                    Text("/night")
                        .font(.caption2)
                        .foregroundStyle(.white)
                        .padding(.horizontal,-30)
                }
                
                Spacer()
                Image(systemName: "heart")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 25))
                    .frame(width: 50, height: 40)
                    .padding()
                
            }
        }
        
        VStack{
            HStack{
                Spacer()
                
                ZStack {
                    Color.white.opacity(0.8)
                        .frame(width: 60, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                        .shadow(radius: 4)
                        .padding()
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .padding(.horizontal, -5)
                        
                        
                        Text("4.8")
                            .foregroundColor(.blue)
                            .bold()
                            .padding(.horizontal, -3)
                    }
                }.padding()
            }
            .padding(.vertical,-170)
        }
        Spacer()
    }
}
var image12: some View{
    
    ZStack {
        // Image
        Image("image2")
            .resizable()
            .frame(width: 200, height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding()
        
        // Overlay views
        VStack {
            Spacer()
            VStack(alignment: .leading) {
                Text("Modernica Apartme...")
                    .bold()
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text("Saudi Arabia. Riyadh")
                    .font(.caption2)
                    .foregroundStyle(.white)
            }.padding(.horizontal)
            
            
            HStack {
                HStack{
                    Text("$30")
                        .bold()
                        .font(.caption2)
                        .foregroundStyle(.white)
                        .frame(width: 70)
                    
                    Text("/night")
                        .font(.caption2)
                        .foregroundStyle(.white)
                        .padding(.horizontal,-30)
                }
                
                Spacer()
                Image(systemName: "heart")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 25))
                    .frame(width: 50, height: 40)
                    .padding()
                
            }
        }
        
        VStack{
            HStack{
                Spacer()
                
                ZStack {
                    Color.white.opacity(0.8)
                        .frame(width: 60, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                        .shadow(radius: 4)
                        .padding()
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .padding(.horizontal, -5)
                        
                        
                        Text("4.8")
                            .foregroundColor(.blue)
                            .bold()
                            .padding(.horizontal, -3)
                    }
                }.padding()
            }
            .padding(.vertical,-170)
        }
        Spacer()
    }
}
var image13: some View{
    
    ZStack {
        // Image
        Image("image3")
            .resizable()
            .frame(width: 200, height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .padding()
        
        // Overlay views
        VStack {
            Spacer()
            VStack(alignment: .leading) {
                Text("Modernica Apartme...")
                    .bold()
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text("Saudi Arabia. Jeddah")
                    .font(.caption2)
                    .foregroundStyle(.white)
            }.padding(.horizontal)
            
            
            HStack {
                HStack{
                    Text("$30")
                        .bold()
                        .font(.caption2)
                        .foregroundStyle(.white)
                        .frame(width: 70)
                    
                    Text("/night")
                        .font(.caption2)
                        .foregroundStyle(.white)
                        .padding(.horizontal,-30)
                }
                
                Spacer()
                Image(systemName: "heart")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 25))
                    .frame(width: 50, height: 40)
                    .padding()
                
            }
        }
        
        VStack{
            HStack{
                Spacer()
                
                ZStack {
                    Color.white.opacity(0.8)
                        .frame(width: 60, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                        .shadow(radius: 4)
                        .padding()
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .padding(.horizontal, -5)
                        
                        
                        Text("4.8")
                            .foregroundColor(.blue)
                            .bold()
                            .padding(.horizontal, -3)
                    }
                }.padding()
            }
            .padding(.vertical,-170)
        }
        Spacer()
    }
}

#Preview {
    Images()
}
