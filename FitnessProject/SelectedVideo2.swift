//
//  SelectedVideo2.swift
//  FitnessProject
//
//  Created by Osama on 28/07/1445 AH.
//

import AVKit
import SwiftUI

struct SelectedVideo2: View {
    let url = URL(string: "https://fzpcrqjbecyohzgvxees.supabase.co/storage/v1/object/public/fitvids/exercisesforsixpackabs.mp4?t=2024-02-09T19%3A24%3A42.668Z")!
    
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
                                                Text("Abs Exercise")
                                                    .font(.title2)
                                                    .bold()
                                                    .fontDesign(.rounded)
                                                Spacer()
                                            } .padding()
                                            
                                            Text("Abdominal exercises are a type of strength exercise that affect the abdominal muscles (colloquially known as the stomach muscles or abs). Human abdominal consist of four muscles which are the rectus abdomens, internal oblique, external oblique, and transversus abdominis.")
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
#Preview { SelectedVideo2() }
