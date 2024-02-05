//
//  ViewLocations.swift
//  EV_Charging_App
//
//  Created by istabraq on 22/07/1445 AH.
//
import SwiftUI

struct AvailableLocation: Identifiable {
    var id: UUID = UUID()
    var mainLocation: String
    var subRoad: String
    var available: String
}

var location1: AvailableLocation = AvailableLocation(mainLocation: "Ev port, Metro Station", subRoad: "1st Cross St, Mount road, Chennai", available: "⚡️Available")
var location2: AvailableLocation = AvailableLocation(mainLocation: "Ev port, Metro Station", subRoad: "1st Cross St, Mount road, Chennai", available: "⚡️Available")
var location3: AvailableLocation = AvailableLocation(mainLocation: "Ev port, Metro Station", subRoad: "1st Cross St, Mount road, Chennai", available: "⚡️Available")
var location4: AvailableLocation = AvailableLocation(mainLocation: "Ev port, Metro Station", subRoad: "1st Cross St, Mount road, Chennai", available: "⚡️Available")
var location5: AvailableLocation = AvailableLocation(mainLocation: "Ev port, Metro Station", subRoad: "1st Cross St, Mount road, Chennai", available: "⚡️Available")

var allLocations: [AvailableLocation] = [location1 , location2 , location3 , location4 , location5]

struct ViewLocations: View {
    var body: some View {
        ZStack {
            ScrollView {
            VStack{
                ForEach(allLocations) { location in
                    HStack {
                        Rectangle()
                            .fill(Color.white)
                            .shadow(radius: 10)
                            .frame(width: 380, height: 150)
                            .overlay {
                                VStack(alignment: .leading) {
                                    Text(location.mainLocation)
                                    Text(location.subRoad)
                                        .bold()
                                        .foregroundColor(.accentColor)
                                    
                                    HStack {
                                        Text(location.available)
                                            .foregroundStyle(.green)
                                        Text("| ChAdeMo")
                                        Image(systemName: "circlebadge.fill")
                                            .resizable()
                                            .frame(width: 5, height: 5)
                                            .foregroundColor(.gray)
                                        
                                        Text("⚡️Available")
                                            .foregroundStyle(.green)
                                        Text("| CCS")
                                    }
                                }
                            }
                    }}
                }
            }
        }
    }
}

#Preview {
    ViewLocations()
}
