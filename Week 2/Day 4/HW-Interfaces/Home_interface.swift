//
//  Home_interface.swift
//  HW-Interfaces
//
//  Created by istabraq on 20/07/1445 AH.
//

import SwiftUI

struct Home_interface: View {
    var body: some View {
        HStack{
            Image(systemName: "arrow.left")
                .bold()
            Spacer()
                .foregroundColor(.black)
            
            ZStack(alignment: .leading){
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                        .font(.system(size: 20))
                        .fontWeight(.thin)
                    Text("Homes")
                    Spacer()
                    Image(systemName: "slider.horizontal.3")
                        .foregroundStyle(.blue)
                        .font(.system(size: 25))
                        .padding()
                    
                }
                .padding(.leading)
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(.gray.opacity(0.1))
                    .frame(height: 60)
            }
        }.padding()
        Buttons()
            .padding()
        
        HStack {
            Text("866 founds")
                .font(.callout)
                .bold()
                .padding()
            
            Spacer()
            
            Image(systemName: "square.text.square.fill")
                .foregroundStyle(.blue)
                .bold()
            Image(systemName: "square.split.2x2.fill")
                .foregroundStyle(.gray)
                .bold()
                .padding()
        }
        HStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack() { // Add spacing between vertical images
                    ForEach(0..<4) { _ in
                                Images_3()
                            }
                        }
                    }
                }
Navigation_buttons()
            }
        }
#Preview {
    Home_interface()
}
