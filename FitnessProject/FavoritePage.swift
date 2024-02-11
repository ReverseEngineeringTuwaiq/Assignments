//
//  FavoritePage.swift
//  FitnessProject
//
//  Created by Osama on 28/07/1445 AH.
//

import SwiftUI

struct FavoritePage: View {
@State var username: String = ""
@State var userage: String = ""
@State var userhight: String = ""
@State var userwight: String = ""
//@State var selectedTab: Tab = .person
@State var status = false

var body: some View {
                ZStack {
                    
                    Color.kolorB.opacity(0.8).ignoresSafeArea()
                        .mask(LinearGradient(gradient: Gradient(stops: [
                            .init(color: .black, location: 0),
                            .init(color: .clear, location: 1),
                        ]), startPoint: .top, endPoint: .bottom)).ignoresSafeArea()
                    
                    
                    VStack{
                        Image("proF")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .padding()
                        Text("User Profile")
                            .fontDesign(.rounded)
                            .font(.title2)
                        
                        
                        TextField("  Name:", text: $username)
                            .background(Color.gray.opacity(0.2))
                            .fontDesign(.rounded)
                            .font(.title)
                            .cornerRadius(8)
                            .frame(width: 350)
                            .padding()
                            // .bold()
                           // .overlay{}
                        
                        
                        TextField("  Age:", text: $userage)
                            .background(Color.gray.opacity(0.2))
                            .fontDesign(.rounded)
                            .font(.title)
                            .cornerRadius(8)
                            .frame(width: 350)
                            .padding()
                            // .bold()
                            
                        
                        TextField("  Hight:", text: $userhight)
                            .background(Color.gray.opacity(0.2))
                            .fontDesign(.rounded)
                            .font(.title)
                            .cornerRadius(8)
                            .frame(width: 350)
                            .padding()
                            // .bold()
                        
                        
                        TextField("  Wight:", text: $userwight)
                            .background(Color.gray.opacity(0.2))
                            .fontDesign(.rounded)
                            .font(.title)
                            .cornerRadius(8)
                            .frame(width: 350)
                            .padding()
                            // .bold()
                            
                        
                        RoundedRectangle(cornerRadius: 16.0)
                            .fill(.yellow)
                            .shadow(color: .black, radius: 2)
                            .frame(width: 100,height: 40)
                            .padding()
                            .overlay {
                                Button("SAVE") { status.toggle() } // save() func with Userdefault
                                    .fontDesign(.rounded)
                                    .bold()
                                    .foregroundColor(.kolorB)
                            }
                        Spacer()
                       // TabBar(selectedTab: $selectedTab)

                    }
                }
            }
        }

#Preview { FavoritePage() }
