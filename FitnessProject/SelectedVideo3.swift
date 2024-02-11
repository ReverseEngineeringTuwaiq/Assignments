//
//  SelectedVideo3.swift
//  FitnessProject
//
//  Created by Osama on 28/07/1445 AH.
//

import AVKit
import SwiftUI

struct SelectedVideo3: View {
    let url = URL(string: "https://fzpcrqjbecyohzgvxees.supabase.co/storage/v1/object/public/fitvids/workoutfour.mp4?t=2024-02-09T19%3A32%3A19.644Z")!
    
    var body: some View {
        ZStack{
            Color.kolorB.opacity(0.8).ignoresSafeArea()
            
            VStack{
                VideoPlayer(player: AVPlayer(url: url),
                videoOverlay: {})
                    .frame(width: 490, height: 400)
                    .border(Color.black)
                    .overlay()
                {
//                    HStack{
//                        Image(systemName: "play")
//                            .resizable()
//                            .foregroundStyle(.white)
//                            .shadow(color: .black, radius: 6)
//                            .bold()
//                            .frame(width: 50, height: 50)
//
//                    }  //.frame(width: 300, height: 300)
                }
            }
        }
        
        
        ZStack {
            Color.kolorB.ignoresSafeArea()
                .mask(LinearGradient(gradient: Gradient(stops: [
                    .init(color: .black, location: 0),
                    .init(color: .clear, location: 1),
                    .init(color: .black, location: 1),
                    .init(color: .clear, location: 1)
                ]), startPoint: .top, endPoint: .bottom))//.ignoresSafeArea()
            VStack{
                    HStack{
                        ScrollView{
                            RoundedRectangle(cornerRadius: 8.0)
                                .fill(.gray.opacity(0.1))
                                .shadow(color: .gray.opacity(0.3), radius: 6)
                                .frame(width: 365,height: 400)
                                .padding()
                                .overlay {
                                    HStack{
                                        VStack{
                                            
                                            HStack{
                                                Text("Dumbbells Exercises")
                                                    .font(.title2)
                                                    .bold()
                                                    .fontDesign(.rounded)
                                                Spacer()
                                            } .padding()
                                            
                                            Text("Dumb bells are often used for joint-isolation exercises such as biceps curls, chest flyes or shoulder raises. Using dumbbells for \nfull-body, multiplanar movements, however, can provide a variety of different strength outcomes.")
                                                .fontDesign(.rounded)
                                                .padding()
                                            Spacer()
                                            
                                        } .padding()
                                        VStack {
                                           Image(systemName: "list.bullet.rectangle")
                                         .resizable()
                                         .foregroundColor(.yellow)
                                         .frame(width: 24, height: 27)
                                         .shadow(color: .black, radius: 10)
                                         .padding()
                                        Spacer()
                                        }
                                         .padding()
                                        Spacer()
                            }
                        }
                    }
                }  //} Text("Video Describtion...")
            }
        }
    }
}
#Preview { SelectedVideo3() }
