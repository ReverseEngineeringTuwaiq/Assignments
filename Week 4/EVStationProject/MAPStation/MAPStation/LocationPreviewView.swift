//
//  LocationPreviewView.swift
//  MAPStation
//
//  Created by istabraq on 28/07/1445 AH.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        HStack (alignment: .bottom, spacing: 0){
            VStack(alignment: .leading, spacing: 16){
                imageSection
                titleSection
                
            }
            
            VStack (spacing: 8){
                plugcharge
                LearnMoreButton
                NextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
    }
}
    
#Preview {
        ZStack{
            //Color.green.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationsViewModel())
    }

extension LocationPreviewView {
        private var imageSection: some View
        {
            ZStack
            {
                if let imageName = location.imageName.first{
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .cornerRadius(10)
                }
            }
            .padding(6)
            .background(Color.white)
            .cornerRadius(10)
        }
    private var titleSection: some View {
        HStack(alignment: .top, spacing: 8) {
            
            LocationMapAnnotionView().titleSection2
                .frame(width: 20, height: 20)
                .padding(.top, 55) // Adjust vertical alignment as needed
            VStack(alignment: .leading, spacing: 4) {
                Text(location.name)
                    .font(.title2)
                    .bold()
                    .padding(.leading, -30.0)
                
                Text(location.descripition)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.trailing, 4.0)
            }
        }
    }
    private var plugcharge: some View
    {
        HStack
        {
            ForEach(location.plugs, id: \.self) { plugName in
                Image(systemName: plugName)
                    .resizable()
                    .foregroundColor(.gray)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
            }
//            Text("Plugs")
//                .font(.callout)
//                .bold()

        }
    }
        private var LearnMoreButton: some View
    {
        Button{
            
        }label: {
            Text("Learn more")
                .font(.headline)
                .bold()
                .frame(width: 125, height: 35)
                .foregroundColor(.white)
            
            
        }.buttonBorderShape(.capsule)
        .background(.mint)
        .buttonStyle(.bordered)
        .cornerRadius(40)
    }
        private var NextButton: some View
        {
            Button{
                vm.nextButtonPressed()
            }label: {
                Text("Next Station")
                    .font(.headline)
                    .bold()
                    .frame(width: 125, height: 35)
                    .foregroundColor(.white)
                
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .background(.mint)
            .cornerRadius(40)
        }
    }


