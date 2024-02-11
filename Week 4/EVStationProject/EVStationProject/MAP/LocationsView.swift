//
//  LocationsView.swift
//  MAPStation
//
//  Created by istabraq on 27/07/1445 AH.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
       ZStack
        {mapLayer
         
                .ignoresSafeArea()
            VStack(spacing: 0)
            {
                header
                .padding()
                Spacer()
                locationPreviewStack
            
            }
        }
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header: some View
    {
        VStack{
            Button(action: vm.toggleLocationsList)
            {
                Text(vm.mapLocation.name + "," + vm.mapLocation.cityName)
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .background(Color.white)
                    .overlay(alignment: .leading)
                {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .padding().rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                }
            }
      
            if vm.showLocationsList{
                LocationsListView()
            }
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: Color/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.3), radius:20, x: 0, y: 15)
    }
    private var mapLayer: some View
    {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: {location in
            MapAnnotation(coordinate:location.coordinates)
            {
                LocationMapAnnotionView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
    private var locationPreviewStack: some View{
        ZStack
        {
            ForEach(vm.locations)
            {location in
                if vm.mapLocation == location{
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
               
            }
        }
    }
}





