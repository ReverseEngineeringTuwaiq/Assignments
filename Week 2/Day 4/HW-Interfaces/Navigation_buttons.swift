//
//  Navigation_buttons.swift
//  HW-Interfaces
//
//  Created by istabraq on 20/07/1445 AH.
//

import SwiftUI

struct Navigation_buttons: View {
    var body: some View {
        VStack (spacing: 0){
            HStack(spacing: 30) {
                Button(action: {}) {
                    VStack {
                        Image(systemName: "house")
                            .font(.title)
                            .foregroundColor(.blue)
                        Text("Home")
                            .font(.caption2)
                            .foregroundColor(.blue)
                    }
                }
                
                Button(action: {}) {
                    VStack{
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.gray)
                        Text("Explore")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
                
                Button(action: {}) {
                    VStack{
                        Image(systemName: "heart")
                            .font(.title)
                            .foregroundColor(.gray)
                        Text("Favourite")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
                
                Button(action: {}) {
                    VStack{
                        Image(systemName: "ellipsis.message")
                            .font(.title)
                            .foregroundColor(.gray)
                        Text("Message")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }
                
                Button(action: {}) {
                    VStack{
                        Image(systemName: "person.crop.circle")
                            .font(.title)
                            .foregroundColor(.gray)
                        Text("Profile")
                            .font(.caption2)
                            .foregroundColor(.gray)
                    }
                }          }
            .padding(.bottom)
        }    }
}

#Preview {
    Navigation_buttons()
}
