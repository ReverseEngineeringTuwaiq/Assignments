//
//  CategoriesPage.swift
//  FitnessProject
//  Created by Osama on 26/07/1445 AH.

import SwiftUI

struct Workout: Identifiable
{   var id: UUID = UUID()
    var title: String
    var supTitle: String   }

enum SelectedVids {
    case Workout1
    case Workout2
    case Workout3
    // etc
}


// 3 DAYS A WEEK
var Workout1: Workout = Workout(title: "FULL BODY \nSPLIT", supTitle: "3 Days a week")
var Workout2: Workout = Workout(title: "UPPER/LOWER SPLIT", supTitle: "3 Days a week")
var Workout3: Workout = Workout(title: "PUSH/PULL \nSPLIT", supTitle: "3 Days a week")
var Workout4: Workout = Workout(title: "MUSCLE GROUP \nSPLIT", supTitle: "3 Days a week")
// 4 DAYS A WEEK
var Workout5: Workout = Workout(title: "UPPER/LOWER SPLIT", supTitle: "4 Days a week")
var Workout6: Workout = Workout(title: "PUSH/PULL \nSPLIT", supTitle: "4 Days a week")
var Workout7: Workout = Workout(title: "MUSCLE GROUP \nSPLIT", supTitle: "4 Days a week")
// 5 DAYS A WEEK
var Workout8: Workout = Workout(title: "PUSH/PULL/LEGS \nSPLIT", supTitle: "5 Days a week")
var Workout9: Workout = Workout(title: "MUSCLE GROUP \nSPLIT", supTitle: "5 Days a week")

// let SelectedVid1 = SelectedVideo1()
// let SelectedVid2 = SelectedVideo2()
// var SelectedVideo = [SelectedVid1, SelectedVid2] as [Any]

var Workouts: [Workout] = [   Workout1,
                              Workout2,
                              Workout3,
                              Workout4,
                              Workout5,
                              Workout6,
                              Workout7,
                              Workout8,
                              Workout9   ]


struct WorkoutsPage: View {
    // let arrayOfVideos: [SelectedVids] = [.Workout1, .Workout2, .Workout3] // etc.
    // internal  let arrayOfVideos : [AnyView]   = [AnyView(SelectedVideo1()), AnyView(SelectedVideo2())]
    @State private var selectedIndex = 1
    @State private var showMenu = false
    @State var selectedTab: Tab = .map
    var body: some View {
        //navigate(to: arrayOfVideos[selectedIndex]
        NavigationView{
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
                
                
                VStack{
                    HStack{
                        Spacer()
                        Text("Workouts")
                            .foregroundStyle(.white)
                            .font(.largeTitle)
                            .bold()
                            .shadow(color: .black, radius: 16)
                            .fontDesign(.rounded)
                            .padding(.init(top: 40, leading: 0, bottom: 30, trailing: 140))
                        
                        
//                        Circle()
//                            .fill(.yellow.opacity(0))
//                            .shadow(color: .black, radius: 6)
//                            .frame(width: 50, height: 50)
//                            .padding()
//                            .overlay {
//                                Image(systemName: "list.bullet") // bookmark - star
//                                    .font(.title3)
//                                    .foregroundStyle(.kolorB)
//                                    .frame(width: 50, height: 50)
//                                    .shadow(color: .black, radius: 1)
//                            } //.padding(.top)
                        ZStack {
                            VStack{
                                Circle()
                                    .fill(.yellow.opacity(0))
                                    .shadow(color: .black, radius: 6)
                                    .frame(width: 50, height: 50)
                                    .padding()
                            }
                            SideMenuView(isShowin: $showMenu)
                        }
                        .navigationTitle("")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem {
                                Button(action: {showMenu.toggle()}, label: {
                                    Circle()
                                        .fill(.yellow)
                                        .shadow(color: .black, radius: 6)
                                        .frame(width: 50, height: 50)
                                        .padding()
                                        .overlay {
                                            Image(systemName: "list.bullet") // bookmark - star
                                                .font(.title3)
                                                .foregroundStyle(.kolorB)
                                                .frame(width: 50, height: 50)
                                                .shadow(color: .black, radius: 1)
                                        }
                                    
                                    Spacer()
                                })
                                
                            }
                        }
                    }
                    //Text("& Exercises")
                    
                    
                    ZStack {
                        VStack{
                            ScrollView {
                                ForEach(Workouts, id: \.id) { workout in
                                    NavigationLink(destination: destinationForWorkout(workout)) {
                                        HStack {
                                            RoundedRectangle(cornerRadius: 16.0)
                                                .fill(.black)
                                                .shadow(color: .black, radius: 6)
                                                .frame(width: 365, height: 180)
                                                .padding(.vertical)
                                                .overlay {
                                                    Image("g-h")
                                                        .resizable()
                                                        .frame(width: 350, height: 180)
                                                        .cornerRadius(16.0)
                                                        .mask(LinearGradient(gradient: Gradient(stops: [
                                                            .init(color: .black, location: 0),
                                                            .init(color: .clear, location: 1),
                                                            .init(color: .black, location: 1),
                                                            .init(color: .clear, location: 1)
                                                        ]), startPoint: .top, endPoint: .bottom))
                                                    HStack {
                                                        VStack {
                                                            Text("\(workout.title)")
                                                                .font(.title2)
                                                                .bold()
                                                                .foregroundStyle(.white)
                                                                .padding()
                                                            Text("\(workout.supTitle)")
                                                                .font(.title3)
                                                        }
                                                        .fontDesign(.rounded)
                                                        .padding()
                                                        Spacer()
                                                        VStack {
                                                            Image(systemName: "arrowshape.forward.fill")
                                                                .bold()
                                                                .foregroundStyle(.white)
                                                                .padding(.horizontal)
                                                        }       .padding()
                                                    }
                                                }
                                            }
                                        } .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                //TabBar(selectedTab: $selectedTab)
                            }
                        }
                    }
                }
            }
        }
    }
func destinationForWorkout(_ workout: Workout) -> some View {
        switch workout.id {
        case Workout1.id:
            return AnyView(SelectedVideo1())
        case Workout2.id:
            return AnyView(SelectedVideo2())
        case Workout3.id:
            return AnyView(SelectedVideo3())
        // Add more cases for different workouts
        default:
            return AnyView(WorkoutsPage())
        }
    }

#Preview { WorkoutsPage() }
