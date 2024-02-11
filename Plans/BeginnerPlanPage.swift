//
//  BeginnerPlanPage.swift
//  FitnessProject
//
//  Created by Osama on 27/07/1445 AH.
//

import SwiftUI

struct BeginnerPlanPage: View {
    var body: some View {
        ZStack{
            Color.kolorB
            .mask(LinearGradient(gradient: Gradient(stops: [
                .init(color: .black, location: 0),
                .init(color: .clear, location: 1),
                .init(color: .black, location: 1),
                .init(color: .clear, location: 1)
            ]), startPoint: .top, endPoint: .bottom))
            .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Beginner Workout Plan")
                        .font(.title)
                        .fontDesign(.rounded)
                        .bold()
                        .padding()
                    
                    Image("g-h2")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .padding()
                    
                    Text("Introduction:")
                        .font(.headline)
                        .fontDesign(.rounded)
                        .bold()
                        .padding(.leading)
                    
                    Text("Welcome to our Beginner Workout Plan. This plan is designed for individuals who are new to fitness and looking to establish a consistent workout routine.")
                        .padding()
                    
                    Text("Plan Overview:")
                        .font(.headline)
                        .fontDesign(.rounded)
                        .bold()
                        .padding(.leading)
                    
                    Text("This 4-week plan includes a mix of strength training and cardio exercises to help you build a strong foundation. Make sure to follow the instructions and perform the exercises with proper form.")
                        .padding()
                    
                    Text("How to Start:")
                        .font(.headline)
                        .fontDesign(.rounded)
                        .bold()
                        .padding(.leading)
                    
                    Text("1. Warm-up: Start each session with a 5-10 minute warm-up to prepare your body for exercise.")
                        .padding(.leading)
                    
                    Text("2. Strength Training: Follow the provided exercises for strength training. Begin with light weights and gradually increase as you feel comfortable.")
                        .padding(.leading)
                    
                    Text("3. Cardio Workouts: Incorporate cardio exercises like walking, jogging, or cycling for at least 30 minutes on non-strength training days.")
                        .padding(.leading)
                    
                    Text("4. Cool Down: Finish each session with a 5-10 minute cool-down to help your body recover.")
                        .padding(.leading)
                    
                    // Add a chart (you can use a library like SwiftUICharts or implement your own)
                    
                    Spacer()
                }
                
                .padding()
            }
            // .background(Color.kolorB)
              // .navigationBarTitle("Beginner Workout Plan")
            
        }
    }
}
        #Preview { BeginnerPlanPage() }
    

// func destinationForWorkout(_ workout: Workout) -> some View {
//     switch workout.id {
//     case 1:
//         return AnyView(SelectedVideo1())
//     case 2:
//         return AnyView(SelectedVideo2())
//     // Add more cases for different workouts
//     default:
//         return AnyView(SelectedDefaultView())
//     }
// }

//
//#Preview { NavinTabs() }





//
//LazyVGrid(columns: row, spacing: 25) {
//                
//              
//                ForEach(Dashboard_Data) { data in
//                    
//                    Button(action: {
//                                             
//                            // action
//                        }) {
//                            
//                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
//                            
//                            VStack(alignment: .leading, spacing: 5) {
//                                
//                                Spacer(minLength: 0)
//
//                                Text(data.data)
//                                    .font(.title)
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.white)
//                                
//                                HStack{
//                                    Spacer(minLength: 0)
//                                    Text(data.suggest)
//                                        .font(.system(size: 17, weight: .regular))
//                                        .lineLimit(2)
//                                        .foregroundColor(.white)
//                                        
//                                }
//                            }.padding()
//                            .background(Color(data.image))
//                            .cornerRadius(20)
//                            .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
//                            
//                            Image(data.imageIcon)
//                                .renderingMode(.template)
//                                .foregroundColor(.white)
//                                .font(.system(size: 25, weight: .regular))
//                                .padding(10)
//                                .background(Color.white.opacity(0.15))
//                                .clipShape(Circle())
//                        }
//                        
//                      
//                    }
//                }
//                
//            }
