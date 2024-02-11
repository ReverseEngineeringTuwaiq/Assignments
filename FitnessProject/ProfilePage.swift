//
//  ProfilePage.swift
//  FitnessProject
//
//  Created by Osama on 26/07/1445 AH.
//


import SwiftUI

struct ProfilePage: View {
    @State private var username: String = UserDefaults.standard.string(forKey: "username") ?? ""
    @State private var userage: String = UserDefaults.standard.string(forKey: "userage") ?? ""
    @State private var userhight: String = UserDefaults.standard.string(forKey: "userhight") ?? ""
    @State private var userwight: String = UserDefaults.standard.string(forKey: "userwight") ?? ""
    @State private var status = false

    var body: some View {
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
                Image("proF")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .padding()

                Text(" User Profile ")
                    .fontDesign(.rounded)
                    .font(.title2)
                    .padding(.bottom)

            HStack{
                Text("Name: ")
                    .fontDesign(.rounded)
                    .foregroundStyle(.yellow.opacity(0.8))
                Spacer()
                } .padding(.horizontal)
                
                
                TextField(" ", text: $username)
                    .background(Color.gray.opacity(0.2))
                    .fontDesign(.rounded)
                    .font(.title)
                    .cornerRadius(8)
                    .frame(width: 365)
                    //.padding(.bottom)

                
            HStack{
                Text("Age: ")
                    .fontDesign(.rounded)
                    .foregroundStyle(.yellow.opacity(0.8))
                    Spacer()
                } .padding(.horizontal)
                
                TextField(" ", text: $userage)
                    .background(Color.gray.opacity(0.2))
                    .fontDesign(.rounded)
                    .font(.title)
                    .cornerRadius(8)
                    .frame(width: 365)
                    //.padding(.bottom)


            HStack{
                Text("Height: ")
                    .fontDesign(.rounded)
                    .foregroundStyle(.yellow.opacity(0.8))
                Spacer()
                } .padding(.horizontal)
                
                TextField(" ", text: $userhight)
                    .background(Color.gray.opacity(0.2))
                    .fontDesign(.rounded)
                    .font(.title)
                    .cornerRadius(8)
                    .frame(width: 365)
                    //.padding(.bottom)

                
            HStack{
                Text("Weight: ")
                    .fontDesign(.rounded)
                    .foregroundStyle(.yellow.opacity(0.8))
                Spacer()
                } .padding(.horizontal)
                
                TextField(" ", text: $userwight)
                    .background(Color.gray.opacity(0.2))
                    .fontDesign(.rounded)
                    .font(.title)
                    .cornerRadius(8)
                    .frame(width: 365)
                    //.padding(.horizontal)

                
                RoundedRectangle(cornerRadius: 16.0)
                    .fill(.yellow)
                    .shadow(color: .black, radius: 2)
                    .frame(width: 100, height: 40)
                    .padding()
                    .overlay {
                        Button("SAVE") {
                            saveUserData()
                        }
                        .fontDesign(.rounded)
                        .bold()
                        .foregroundColor(.kolorB)
                    }
                Spacer()
            }
            .onAppear {
                loadDataFromUserDefaults()
            }
        }
    }

    private func saveUserData() {
        // Save data to UserDefaults
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(userage, forKey: "userage")
        UserDefaults.standard.set(userhight, forKey: "userhight")
        UserDefaults.standard.set(userwight, forKey: "userwight")
    }

    private func loadDataFromUserDefaults() {
        // Load data from UserDefaults
        username = UserDefaults.standard.string(forKey: "username") ?? ""
        userage = UserDefaults.standard.string(forKey: "userage") ?? ""
        userhight = UserDefaults.standard.string(forKey: "userhight") ?? ""
        userwight = UserDefaults.standard.string(forKey: "userwight") ?? ""
    }
}

#Preview { ProfilePage() }




//import SwiftUI
//
//struct ProfilePage: View {
//    @State var username: String = ""
//    @State var userage: String = ""
//    @State var userhight: String = ""
//    @State var userwight: String = ""
//    @State var status = false
//
//    var body: some View {
//        ZStack {
//            
//            Color.kolorB.opacity(0.8).ignoresSafeArea()
//                .mask(LinearGradient(gradient: Gradient(stops: [
//                    .init(color: .black, location: 0),
//                    .init(color: .clear, location: 1),
//                ]), startPoint: .top, endPoint: .bottom)).ignoresSafeArea()
//            
//            
//            VStack{
//                Image("proF")
//                    .resizable()
//                    .frame(width: 150, height: 150)
//                    .clipShape(Circle())
//                    .padding()
//                Text("User Profile")
//                    .fontDesign(.rounded)
//                    .font(.title2)
//                
//                
//                TextField("  Name:", text: $username)
//                    .background(Color.gray.opacity(0.2))
//                    .fontDesign(.rounded)
//                    .font(.title)
//                    .cornerRadius(8)
//                    .frame(width: 350)
//                    .padding()
//                    
//                
//                
//                TextField("  Age:", text: $userage)
//                    .background(Color.gray.opacity(0.2))
//                    .fontDesign(.rounded)
//                    .font(.title)
//                    .cornerRadius(8)
//                    .frame(width: 350)
//                    .padding()
//                    
//                
//                TextField("  Hight:", text: $userhight)
//                    .background(Color.gray.opacity(0.2))
//                    .fontDesign(.rounded)
//                    .font(.title)
//                    .cornerRadius(8)
//                    .frame(width: 350)
//                    .padding()
//                
//                
//                TextField("  Wight:", text: $userwight)
//                    .background(Color.gray.opacity(0.2))
//                    .fontDesign(.rounded)
//                    .font(.title)
//                    .cornerRadius(8)
//                    .frame(width: 350)
//                    .padding()
//                    
//                
//                RoundedRectangle(cornerRadius: 16.0)
//                    .fill(.yellow)
//                    .shadow(color: .black, radius: 2)
//                    .frame(width: 100,height: 40)
//                    .padding()
//                    .overlay {
//                        Button("SAVE") { }
//                            .fontDesign(.rounded)
//                            .bold()
//                            .foregroundColor(.kolorB)
//                    }
//                Spacer()
//            }
//        }
//    }
//}
//
//#Preview { ProfilePage() }
