//
//  ScrollHoriz.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 21/07/1445 AH.
//

import SwiftUI

struct Hotel: Identifiable {
    var id: UUID = UUID()
    var headerImage: String
    var title: String
    var location: String
    var date: String
}

struct PopularTrip: View {
    var hotels: [Hotel] = [Hotel(headerImage: "cox",
                                 title: "Cox's Bazar Beach",
                                 location: "Cox's Bazar",
                                 date: "21 Feb - 27 Feb"),
                           Hotel(headerImage: "tent",
                                 title: "sajek",
                                 location: "Ranga",
                                 date: "10 Feb - 13 Feb")
                           ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 25) {
                ForEach(hotels, id: \.id) { hotel in
                    Trip(image: hotel.headerImage,
                         tripTitle: hotel.title,
                         location: hotel.location,
                         date: hotel.date)
                }
            }
        }
        .padding()
    }
}

struct Trip: View {
    let image: String
    let tripTitle: String
    let location: String
    let date: String
    
    let imageWidth: CGFloat = 270
    let imageHeight: CGFloat = 150

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .frame(width: 300, height: 250)
                .shadow(color: .gray.opacity(0.2), radius: 25, x: 10, y: 10)

            VStack {
                Image(image)
                    .resizable()
                    .frame(width: imageWidth,
                           height: imageHeight)
                    .cornerRadius(20)
                    .overlay {
                        ZStack {
                            Circle()
                                .frame(height: 35)
                                .foregroundColor(.red)
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 15, height: 17)
                                .foregroundColor(.white)
                        }
                        .offset(x: imageWidth/2.5,
                                y: imageHeight/2)
                    }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(tripTitle)
                        .font(.system(size: 20))
                        .bold()
                    HStack {
                        horizontalIconWithTitle(title: location,
                                                icon: "location.circle.fill")
                        horizontalIconWithTitle(title: date,
                                                icon: "calendar.circle.fill")
                    }
                }
            }
        }
    }
}

struct horizontalIconWithTitle: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 15, height: 15)
            Text(title)
                .font(.system(size: 15))
                .foregroundColor(.black.opacity(0.7))
        }
    }
}

#Preview {
    PopularTrip()
}
