//
//  Images_3.swift
//  HW-Interfaces
//
//  Created by istabraq on 20/07/1445 AH.
//

import SwiftUI

struct Images_3: View {
    var body: some View
    {
        HStack(spacing: 20) {
                 RoundedRectangle(cornerRadius: 25.0)
                     .fill(Color.white)
                     .shadow(color: Color.black.opacity(0.2), radius: 6)
                     .frame(width: 350, height: 150)
                     .overlay {
                         HStack {
                             // Image on the left
                             Image("image2")
                                 .resizable()
                                 .frame(width: 150, height: 125)
                                 .clipShape(RoundedRectangle(cornerRadius: 12))
                                 .padding()
                             
                             // Details on the right
                             VStack(alignment: .leading, spacing: 0) {
                                 Text("Modernica Apartment")
                                     .bold()
                                     .font(.callout)
                                     .foregroundColor(.black)
                                 
                                 Text("New York, US")
                                     .font(.caption2)
                                     .foregroundColor(.black)
                                 
                                 HStack {
                                     Text("$29")
                                         .bold()
                                         .font(.callout)
                                         .foregroundColor(.blue)
                                     
                                     Text("/night")
                                         .font(.caption2)
                                         .foregroundColor(.black)
                                     
                                     Spacer()
                                     
                                     Image(systemName: "heart")
                                         .foregroundColor(.blue)
                                         .font(.system(size: 25))
                                 }
                                 
                                 HStack {
                                     Spacer()
                                     ZStack {
                                         RoundedRectangle(cornerRadius: 9)
                                             .fill(Color.white.opacity(0.8))
                                             .frame(width: 60, height: 25)
                                             .shadow(radius: 4)
                                         
                                         HStack {
                                             Image(systemName: "star.fill")
                                                 .foregroundColor(.yellow)
                                             
                                             Text("4.8")
                                                 .foregroundColor(.blue)
                                                 .bold()
                                         }
                                     }
                                 }
                             }
                             .padding()
                         }
                     }
             }
             .padding()
         }
     }
#Preview {
    Images_3()
}
