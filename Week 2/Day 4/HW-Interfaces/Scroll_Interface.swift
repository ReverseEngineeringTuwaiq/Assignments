//
//  Scroll_Interface.swift
//  HW-Interfaces
//
//  Created by istabraq on 19/07/1445 AH.
//

import SwiftUI

struct Scroll_Interface: View {
    var body: some View {
        VStack {
            HStack {
                Image("image1")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding()
                VStack (alignment: .leading)
                {
                    Text("Good Morning 👋")
                        .foregroundColor(.black) // Adjust the color as needed
                    HStack {
                        Text("Andrew Ainsley")
                            .bold()
                    }
                    
                }
                Spacer()
                
                Button {
                    // ACTION
                } label: {
                    Circle()
                        .fill(Color.white)
                        .shadow(color: Color.black.opacity(0.2), radius: 6)
                        .frame(width: 50, height: 50)
                        .overlay {
                            Image(systemName: "bell.badge")
                                .font(.title3)
                                .fontWeight(.light)
                                .foregroundColor(.black)
                        }.padding()
                }
            }
            ZStack(alignment: .leading){
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                        .font(.system(size: 20))
                        .fontWeight(.thin)
                    Text("Search")
                        .opacity(0.3)
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
                
            }.padding()
            ScrollView {
                HStack {
                    Text("Featured")
                        .font(.callout)
                        .bold()
                        .padding()
                    
                    Spacer() // Add Spacer to push "See All" to the right
                    
                    Text("See All")
                        .font(.callout)
                        .foregroundStyle(.blue)
                        .bold()
                        .padding()
                }
                //.frame(maxWidth: .infinity)
                VStack {
                    Images()
                }
                HStack {
                    Text("Our Recommendation")
                        .font(.callout)
                        .bold()
                        .padding()
                    
                    Spacer()
                    
                    Text("See All")
                        .font(.callout)
                        .foregroundStyle(.blue)
                        .bold()
                        .padding()
                }
                
                Buttons()
                
                HStack {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 40) { // Add spacing between vertical images
                            ForEach(0..<4) { _ in
                                HStack(spacing: 20) { // Add spacing between horizontal images
                                    ForEach(0..<2) { _ in
                                        Images_2()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        Navigation_buttons()
    }
}


    


#Preview {
    Scroll_Interface()
}
