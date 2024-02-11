//
//  LocationMapAnnotion.swift
//  MAPStation
//
//  Created by istabraq on 28/07/1445 AH.
//

import SwiftUI

struct LocationMapAnnotionView: View {
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: "bolt.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(.mint)
                .cornerRadius(36)
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.mint)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 35)
        }
        
    }
     var titleSection2: some View {
        VStack(spacing: 0){
            Image(systemName: "circle")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .font(.headline)
                .foregroundColor(.white)
                .padding(3)
                .background(.mint)
                .cornerRadius(7)
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.mint)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 35)
        }
    }
}

#Preview {
    LocationMapAnnotionView()
}
