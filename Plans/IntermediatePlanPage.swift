//
//  IntermediatePlanPage.swift
//  FitnessProject
//
//  Created by Osama on 29/07/1445 AH.
//

import SwiftUI

struct IntermediatePlanPage: View {
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
                    Text("Intermediate Workout Plan")
                        .font(.title)
                        .fontDesign(.rounded)
                        .bold()
                       // .padding()
                    
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
#Preview { IntermediatePlanPage() }
