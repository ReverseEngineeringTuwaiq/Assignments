//
//  NearByLocation.swift
//  EV_Charging_App
//
//  Created by istabraq on 21/07/1445 AH.
//
import SwiftUI
import MapKit

struct NearByLocation: View {
    @State var searchText: String = ""
    @State var isViewNearByLocationActive = false
    
    struct MapView: UIViewRepresentable {
        func makeUIView(context: Context) -> MKMapView {
            let mapView = MKMapView()
            let riyadhLocation = CLLocationCoordinate2D(latitude: 24.7136, longitude: 46.6753)
            let region = MKCoordinateRegion(center: riyadhLocation, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: true)
            
            return mapView
        }
        
        func updateUIView(_ uiView: MKMapView, context: Context) {
        }
    }
    
    var body: some View {
        NavigationView {
        ZStack(alignment: .topLeading) {
            MapView()
                .edgesIgnoringSafeArea(.all)
                VStack {
                HStack {
                    NavigationLink(destination: Profile()) {
                        Circle()
                            .fill(Color.white)
                            .shadow(radius: 10)
                            .frame(width: 50, height: 50)
                            .overlay {
                                Image(systemName: "line.horizontal.3")
                                    .bold()
                                    .foregroundColor(.black)
                            }
                            .padding(.leading, 8) // Adjust as needed
                    }
                    
                    Spacer()
                    
                    Button {
                        // Button action
                    } label: {
                        Circle()
                            .fill(Color.white)
                            .shadow(radius: 10)
                            .frame(width: 50, height: 50)
                            .overlay {
                                Image(systemName: "slider.horizontal.3")
                                    .bold()
                                    .foregroundColor(.black)
                                
                            }
                            .padding(.trailing, 8) // Adjust as needed
                    }
                }
                .padding(.top, 20) // Adjust as needed
                
                // HStack to hold the icons and the text
                HStack {
                    ZStack{
                        TextField("        Search location for charging spots", text: $searchText)
                            .foregroundColor(.gray)
                            .padding()
                            .lineLimit(1)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .shadow(radius: 4)
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding(.trailing, 320)
                        
                        Spacer()
                        
                        Image(systemName: "mic.fill")
                            .foregroundColor(.gray)
                            .padding(.leading, 320)
                    }
                }
                
            }
            ZStack{
                HStack {
                    
                    VStack (alignment: .trailing) {
                        Spacer()
                        
                        Button {
                            // Button action
                        } label: {
                            Circle()
                                .fill(Color.white)
                                .shadow(radius: 10)
                                .frame(width: 50, height: 50)
                                .overlay {
                                    Image(systemName: "location.fill")
                                        .bold()
                                        .foregroundColor(.accentColor)
                                }
                        }.padding(.trailing, 12.0)
                        
                        HStack{
                        VStack {
                            NavigationLink(destination: ViewLocations()) {
                                Circle()
                                    .fill(Color.white)
                                    .shadow(radius: 10)
                                    .frame(width: 50, height: 50)
                                    .overlay {
                                        Image(systemName: "list.bullet")
                                            .bold()
                                            .foregroundColor(.accentColor)
                                    }
                            }
                        }
                                }.padding([.bottom, .trailing], 12.0)
                                ZStack{
                                    VStack (spacing: 0) {
                                        HStack {
                                            Rectangle()
                                                .fill(Color.white)
                                                .shadow(radius: 10)
                                                .frame(width: 380, height: 150)
                                                .overlay {
                                                    VStack(alignment: .leading) {
                                                        Text("Ev port, Metro Station")
                                                        Text("1st Cross St, Mount road, Chennai")
                                                            .bold()
                                                            .foregroundColor(.accentColor)
                                                        
                                                        HStack {
                                                            Text("⚡️Available")
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
                                        }
                                        
                                        HStack(spacing: 0) {
                                            NavigationLink(destination: CheckIn()) {
                                                Text("Check-in")
                                                    .foregroundColor(.white)
                                                    .frame(maxWidth: .infinity)
                                                    .padding()
                                                    .background(Color.blue)
                                                    .cornerRadius(2)
                                            }
                                            .padding(.horizontal, 5)
                                        }

                                    }
                                }
                            }
                            
                        }
                    }
                }
            }
        }
    }
#Preview {
    NearByLocation()
}
