//
//  ScrollHoriz2.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 21/07/1445 AH.
//

import SwiftUI

struct Hotel2: Identifiable {
    var id: UUID = UUID()
    var headerImage: String
    var title1: String
    var title2: String
    var rating: String
    var NumberOfNotifications: String
}

struct PopularTrip2: View {
    var hotels2: [Hotel2] = [Hotel2(headerImage: "baseball.circle.fill",
                                    title1: "VENUS",
                                    title2: "Travel Agancy",
                                    rating: "4.9",
                                    NumberOfNotifications: "+349"),
                             Hotel2(headerImage: "baseball.circle.fill",
                                    title1: "Tower",
                                    title2: "Travel Agancy",
                                    rating: "3.5",
                                    NumberOfNotifications: "+170")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 25) {
                ForEach(hotels2, id: \.id) { hotel2 in
                    Trip2(headerImage: hotel2.headerImage,
                          title1: hotel2.title1,
                          title2: hotel2.title2,
                          rating: hotel2.rating,
                          NumberOfNotifications: hotel2.NumberOfNotifications)
                }
            }
        }
        .padding()
    }
}
        
struct Trip2: View {
    var headerImage: String
    var title1: String
    var title2: String
    var rating: String
    var NumberOfNotifications: String

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.white)
            .frame(width: 300, height: 180)
            .shadow(color: .gray.opacity(0.2), radius: 25, x: 10, y: 10)
            .overlay {
                VStack(alignment: .leading) {
                    UpperView(headerImage: headerImage, title1: title1, title2: title2, rating: rating)
                    
                    Spacer()
                    
                    BottomView(NumberOfNotifications: NumberOfNotifications)
                }
                .padding()
            }
    }
}

struct UpperView: View {
    let headerImage: String
    let title1: String
    let title2: String
    let rating: String
    
    var body: some View {
        HStack {
            Image(systemName: headerImage)
                .foregroundColor(.blue)
                .font(.system(size: 50))
                .offset(x: -10)
            
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading) {
                    Text(title1)
                        .bold()
                    Text(title2)
                        .bold()
                }
                
                // Star and rating
                HStack {
                    StarView()
                    Text(rating)
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                }
            }
        }
    }
}

struct StarView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(height: 30)
                .foregroundColor(.yellow)
                .opacity(0.4)
            
            Image(systemName: "star.fill")
                .font(.system(size: 15))
                .foregroundColor(.orange)
                .opacity(1)
        }
    }
}

struct BottomView: View {
    let NumberOfNotifications: String
    
    var body: some View {
        HStack {
            Image("manorange")
                .resizable()
                .frame(width: 30, height: 30, alignment:.trailing)
                .cornerRadius(30)
            
            Image("manyell")
                .resizable()
                .frame(width: 30, height: 30, alignment:.trailing)
                .cornerRadius(30)
            
            NotificationView(NumberOfNotifications: NumberOfNotifications)
            
            Text("Liked This")
                .foregroundStyle(.gray)
                .font(.system(size: 13))
        }
    }
}

struct NotificationView: View {
    let NumberOfNotifications: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .frame(width: 40, height: 35, alignment: .leading)
                .foregroundColor(.blue)
                .opacity(0.2)
            
            Text(NumberOfNotifications)
                .foregroundStyle(.blue)
                .font(.system(size: 13))
        }
    }
}

#Preview {
    PopularTrip2()
}
