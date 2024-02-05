//
//  Images 2.swift
//  HW-Interfaces
//
//  Created by istabraq on 20/07/1445 AH.
//

import SwiftUI

struct Images_2: View {
    var body: some View {
        
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 6)
                .frame(width: 150, height: 200) // Adjusted to be square
            
                .overlay {
                    // Overlay views
                    VStack {
                        Image("image2")
                                    .resizable()
                                    .frame(width: 150, height: 125)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    // Spacer()
                        VStack(alignment: .leading) {
                            Text("Modernica Apartme...")
                                .bold()
                                .font(.callout)
                                .foregroundStyle(.black)
                            
                            Text("New York. US")
                                .font(.caption2)
                                .foregroundStyle(.black)
                        }//.padding(.horizontal)
                        
                        HStack {
                            HStack{
                                Text("$29")
                                    .bold()
                                    .font(.callout)
                                    .foregroundStyle(.blue)
                                    .frame(width: 70)
                                
                                Text("/night")
                                    .font(.caption2)
                                    .foregroundStyle(.black)
                                    .padding(.horizontal,-20)
                            }
                            
                            Spacer()
                            Image(systemName: "heart")
                                .foregroundColor(.blue)
                                .font(.system(size: 25))
                                .frame(width: 20, height: 20)
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
                            }.padding(.horizontal, -5)
                        }
                        .padding(.vertical,-106)
                    }
                    
                    
                }
        }
    }

#Preview {
    Images_2()
}
