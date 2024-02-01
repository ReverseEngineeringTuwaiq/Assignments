//
//  interface2.swift
//  swiftAssignment
//
//  Created by Bushra Abuhaimed on 19/07/1445 AH.
//

import SwiftUI

struct Interface2: View {
    var body: some View {
        ScrollView {
            HStack {
                GreetingView()
                Spacer()
                BellView()
            }
            SearchBar()
            VStack(spacing: 30) {
                VStack {
                    FeaturedTitleView()
                    FeaturedView()
                }
                VStack {
                    RecommendationTitleView()
                    RecommendationFilterView()
                    RecommendationView()
                }
            }
        }
        .padding([.leading, .trailing], 10)
    }
}

#Preview {
    Interface2()
}

// MARK: - GreetingView
struct GreetingView: View {
    var body: some View {
        HStack {
            Image("manpic1")
                .resizable()
                .frame(width: 50,height: 50, alignment: .leading)
                .cornerRadius(30)
            
            GreetingTitleView()
        }
    }
}

// MARK: - GreetingView
struct BellView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(.clear)
                .strokeBorder(.gray.opacity(0.5))
                .frame(width: 50, height: 50, alignment:.trailing)
            
            Image(systemName: "bell.badge")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(width: 50, height: 50, alignment: .trailing)
                .font(.system(size: 25))
        }
    }
}

// MARK: - GreetingTitleView
struct GreetingTitleView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Good Morning 👋")
                .foregroundStyle(.gray)
            Text("Andrew Ainsley")
                .font(.system(size: 15))
                .bold()
        }
    }
}

// MARK: - SearchBar
struct SearchBar: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 15)
                .padding()
                .frame(height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(.gray.opacity(0.1))
                .overlay{
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .opacity(0.3)
                        
                        Text("search")
                            .opacity(0.3)
                        Spacer()
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .foregroundColor(.blue)
                    }// HStack end
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment:.leading)
                    .padding(.horizontal,35)
                }//overlay end
        }
    }
}

// MARK: - FeaturedTitleView
struct FeaturedTitleView: View {
    var body: some View {
        HStack {
            Text("Featured")
                .bold()
            Spacer()
            Text("See all")
                .font(.system(size: 15))
                .foregroundColor(.blue)
        }
    }
}

// MARK: - FeaturedView

struct FeaturedView: View {
    var featuredArray = ["Modernica Apartment", "Merica Apartment ", "Seritta Apartment "]
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(featuredArray, id: \.self) { name in
                    ZStack(alignment: .bottom) {
                        //Image("modern Apartment")
                        //Image(rectangle.imageName.iconName)
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 200, height: 250)
                            .foregroundColor(.blue)
                        Text(name)
                            .padding()
                    }
                }
            }
        }
    }
}

// MARK: - FeaturedTitleView
struct RecommendationTitleView: View {
    var body: some View {
        HStack {
            Text("Our Recommendation")
                .bold()
            Spacer()
            Text("See all")
                .font(.system(size: 15))
                .foregroundColor(.blue)
        }
    }
}

// MARK: - FeaturedView
struct RecommendationFilterView: View {
    var filterArray = ["✅ All", "🏡 House", "🏘️ Villa", "🏢 Apartment"]
    let rows = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(filterArray, id: \.self) { name in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 30)
                            .foregroundColor(.white)
                            .border(.blue)
                            .border(.blue, width: 2)
                            .cornerRadius(30)
                        Text(name)
    
                            .foregroundStyle(.black)
                            .background(.clear)
                            .padding()
                    }
                }
            }
        }
    }
}

// MARK: - FeaturedView
struct RecommendationView: View {
    var recommendationArray = ["La Grand Maison", "Alpha Housing", "Mill House", "Astute Homes", "White Cottage", "Carriage House"]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(recommendationArray, id: \.self) { name in
                    ZStack(alignment: .bottom) {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 150, height: 200)
                            .foregroundColor(.blue)
                        Text(name)
                            .padding()
                    }
                }
            }
        }
    }
}




