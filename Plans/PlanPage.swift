//
//  PlanPage.swift
//  FitnessProject
//
//  Created by Osama on 29/07/1445 AH.
//

import SwiftUI

struct WorkoutPlansPage: View {
    var workoutPlans = [" Beginner", " Intermediate", " Advanced"]
    var progressData = [0.5, 0.3, 0.8]

    var body: some View {
            NavigationView {
                ZStack(alignment: .top){
                    Color.kolorB.opacity(0.9).ignoresSafeArea()
                        .mask(LinearGradient(gradient: Gradient(stops: [
                            .init(color: .black, location: 0),
                            .init(color: .clear, location: 1),
                        ]), startPoint: .top, endPoint: .bottom)).ignoresSafeArea()
                    
                    
                    Image("bg22").resizable()
                        .mask(LinearGradient(gradient: Gradient(stops: [
                            .init(color: .black, location: 0),
                            .init(color: .clear, location: 1),
                            .init(color: .black, location: 1),
                            .init(color: .clear, location: 1)
                        ]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 400, height: 180)
                        .ignoresSafeArea()
                    
                VStack {
                    HStack{
                          //  .padding(.trailing)
                        Text(" Start your Journey ")
                            .font(.title)
                            .shadow(color: .black, radius: 16)
                            .opacity(0.4)
                            .padding()
                        Spacer()
                    }
                    List {
                        ForEach(workoutPlans, id: \.self) { plan in
                            NavigationLink(destination: destinationView(for: plan)) {
                                Image(systemName: "line.3.horizontal")
                                Text(plan)
                                    .fontDesign(.rounded)
                                    .font(.title3)
                                    .padding()
                                
                            }
                        }
                    } .scrollContentBackground(.hidden)
                    
                    
                }
                .navigationTitle("Workout Plans")
                .shadow(color: .black , radius: 30)
                    
                } //.background(Color.)
        }
    }
    func destinationView(for plan: String) -> some View {
        switch plan {
        case " Beginner":
            return AnyView(BeginnerPlanPage())
        case " Intermediate":
            return AnyView(IntermediatePlanPage())
        case " Advanced":
            return AnyView(AdvancedPlanPage())
        default:
            return AnyView(EmptyView())
        }
    }
}

#Preview { WorkoutPlansPage() }

//struct BeginnerPlanPage: View {
//    var body: some View {
//        Text("Beginner Plan Details")
//            .font(.title)
//            .padding()
//            .navigationBarTitle("Beginner Plan")
//    }
//}
//
//struct IntermediatePlanPage: View {
//    var body: some View {
//        Text("Intermediate Plan Details")
//            .font(.title)
//            .padding()
//            .navigationBarTitle("Intermediate Plan")
//    }
//}
//
//struct AdvancedPlanPage: View {
//    var body: some View {
//        Text("Advanced Plan Details")
//            .font(.title)
//            .padding()
//            .navigationBarTitle("Advanced Plan")
//    }
//}



//import SwiftUI
//
//struct PlanPage: View {
//    var workoutPlans = ["Beginner Plan", "Intermediate Plan", "Advanced Plan"]
//    
//    var body: some View {
//        NavigationView {
//            ZStack{
//                VStack {
//                    Text("Choose a Workout Plan")
//                        .font(.title)
//                        .padding()
//                    
//                    List(workoutPlans, id: \.self) { plan in
//                        NavigationLink(destination: BeginnerPlanPage())
//                        {
//                            Text(plan)
//                            
//                        }.font(.title3).bold().fontDesign(.rounded)
//                        .listRowBackground(Color.kolorB)
//                    }
//                    .padding()
//                    
//                    
//                    // Add more features like buttons to start a selected plan, progress tracking, etc.
//                }
//                .navigationTitle("Workout Plans")
//                
//                //.background(Color.kolorB)
//                
//                
//            }
//        }.ignoresSafeArea()
//    }
//}
//
//#Preview {
//    PlanPage()
//}
