//
//  CustomTabBar.swift
//  FitnessProject
//
//  Created by Osama on 27/07/1445 AH.
//var fimg: String { selectedTab.rawValue + ".fill" }


import SwiftUI

enum Tab: String, CaseIterable {
    case person
    case map
    case doc = "doc.text" // 
}

struct TabBar: View {
    @Binding var selectedTab: Tab
    // var fimg: String { selectedTab.rawValue + ".fill" }
    var body: some View {
                VStack {
                    HStack {
                        ForEach(Tab.allCases, id: \.rawValue) { tab in
                            Spacer()
                            Image(systemName: selectedTab == tab ? fimg : tab.rawValue)
                                .scaleEffect(selectedTab == tab ? 1.5 : 1.2)
                                .foregroundColor(selectedTab == tab ? .yellow : .white)
                                .font(.system(size: 22))
                                .onTapGesture { selectedTab = tab }
                            Spacer()
                        }
                    }
                }
                .frame(height: 60)
                .background(.thinMaterial)
                .cornerRadius(16)
                .padding()
            }
            var fimg: String { selectedTab.rawValue + ".fill" }
          }

        struct ContentView22: View {
            @State var selectedTab: Tab

            var body: some View {
                NavigationView {
                    VStack {
                        viewForSelectedTab()
                        TabBar(selectedTab: $selectedTab)
                    }
                   // .navigationTitle(tabTitle(for: selectedTab))
                }
            }

            private func viewForSelectedTab() -> some View {
                switch selectedTab {
                case .person:
                    return AnyView(ProfilePage())
                case .map:
                    return AnyView(WorkoutsPage())
                case .doc:
                    return AnyView(WorkoutPlansPage())
                }
            }

            private func tabTitle(for tab: Tab) -> String {
                switch tab {
                case .person:
                    return "Profile"
                case .map:
                    return "Workout"
                case .doc:
                    return "Progress"
                }
            } 
        } 

        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView22(selectedTab: .map)
            }
        }

        
        
        
//        NavigationView {
//            TabView(selection: $selectedTab) {
//                ProfilePage()
//                    .tabItem {
//                        Label("Profile", systemImage: "person")
//                    }
//                //Image(systemName: selectedTab == person ? fimg : person.rawValue)
//                //                     .scaleEffect(selectedTab == person ? 1.5 : 1.2)
//                //                     .foregroundColor(selectedTab == person ? .yellow : .white)
//                //                     .font(.system(size: 22))
//                //                     .onTapGesture{selectedTab = person}
//                //                     .tag(Tab.person)
//                    .tag(Tab.person)
//
//                WorkoutsPage()
//                    .tabItem {
//                        Label("Workouts", systemImage: "map")
//                    }
////                Image(systemName: selectedTab == map ? fimg : map.rawValue)
////                     .scaleEffect(selectedTab == map ? 1.5 : 1.2)
////                     .foregroundColor(selectedTab == map ? .yellow : .white)
////                     .font(.system(size: 22))
////                     .onTapGesture{selectedTab = map}
////                     .tag(Tab.map)
//
//                ProgressReportPage()
//                    .tabItem {
//                        Label("Progress", systemImage: "chart.bar")
//                    }
//                //Image(systemName: selectedTab == chart ? fimg : chart.rawValue)
//                //                     .scaleEffect(selectedTab == chart ? 1.5 : 1.2)
//                //                     .foregroundColor(selectedTab == chart ? .yellow : .white)
//                //                     .font(.system(size: 22))
//                //                     .onTapGesture{selectedTab = chart}
//                //                     .tag(Tab.chart)
//                    .tag(Tab.chart)
//            }
//            .navigationBarTitle(tabTitle(for: selectedTab))
//            .navigationBarItems(trailing: NavigationLink(destination: SettingsPage()) {
//                Image(systemName: "gear")
//            })
//        }
        
        
        
//
//        VStack{
//            HStack{
//                ForEach(Tab.allCases, id: \.rawValue) { tab in
//                    Spacer()
//                    Image(systemName: selectedTab == tab ? fimg : tab.rawValue)
//                         .scaleEffect(selectedTab == tab ? 1.5 : 1.2)
//                         .foregroundColor(selectedTab == tab ? .yellow : .white)
//                         .font(.system(size: 22))
//                         .onTapGesture{selectedTab = tab}
//                    Spacer()
//                }
//            }
//        }
//        .frame(width: nil, height: 60)
//        .background(.thinMaterial)
//        .cornerRadius(16)
//        .padding()
//    }
//}
//
//    private func tabTitle(for tab: Tab) -> String {
//        switch tab {
//        case .person:
//            return ""
//        case .map:
//            return ""
//        case .chart:
//            return ""
//        }
//    }

//struct SettingsPage: View {
//    var body: some View {
//        Text("Settings Page")
//    }
//}


//#Preview {
//    TabBar(selectedTab: .constant(.map))
//}

                
