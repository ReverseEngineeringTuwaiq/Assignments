//
//  CheckIn.swift
//  EV_Charging_App
//
//  Created by istabraq on 22/07/1445 AH.
//

import SwiftUI

struct CheckIn: View {
    var body: some View {
        ScrollView {
            ZStack{
                
                VStack(alignment: .leading)
                {
                    HStack {
                        Text("EV port, Mount road")
                            .font(.title3)
                            .bold()
                        Image(systemName: "info.circle.fill")
                        Text("info")
                    }
                    HStack {
                        Image(systemName: "pin.fill")
                            .foregroundStyle(.gray)
                        Text("23, 2nd Main Rd, Mount Road")
                            .foregroundStyle(.gray)
                    }
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text("4.5")
                        Image(systemName: "fuelpump")
                            .foregroundStyle(.green)
                        Text("4 ports (4/4 available)")
                    }
                    
                }.padding(.trailing, 100)
                
                
                HStack {
                    Spacer()
                    VStack{
                        Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.cyan)
                        Text("2 km away")
                            .foregroundStyle(.gray)
                        
                    }.padding(.horizontal)
                }
            }
            VStack{
                Rectangle()
                    .fill(Color.gray) // Adjust the color as needed
                    .frame(height: 1)
            }
            
            VStack{
                Text("Ports")
                    .bold()
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
            Rectangle()
                .fill(Color.gray) // Adjust the color as needed
                .frame(height: 1)
            ZStack {
                
                VStack(alignment: .leading, spacing: 10){
                    HStack {
                        Text("Charger-1, port 1")
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("CHAdeMo")
                            .font(.headline)
                        
                        HStack {
                            Image(systemName: "clock")
                            Text("S.R 125 /h")
                            
                            Image(systemName: "bolt.circle")
                            Text("50 kW")
                        }
                    }
                }
                .padding(.trailing, 100)
                
                
                HStack {
                    VStack {
                        Image(systemName: "ev.plug.dc.chademo")
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 30, height: 30)
                    }.padding(.vertical,-20)
                        .padding(.horizontal, 12)
                    Spacer()
                }
                
            }
            Rectangle()
                .fill(Color.gray) // Adjust the color as needed
                .frame(height: 1)
            ZStack {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Charger-1, port 2")
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("CCS-2")
                            .font(.headline)
                        
                        HStack {
                            Image(systemName: "clock")
                            Text("S.R 125 /h")
                            
                            Image(systemName: "bolt.circle")
                            Text("50 kW")
                        }
                    }
                }
                .padding(.trailing, 100)
                
                
                HStack {
                    VStack {
                        Image(systemName: "ev.plug.dc.ccs2")
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 30, height: 30)
                    }.padding(.vertical, -20)
                        .padding(.horizontal , 12)
                    Spacer()
                }
                
            }
            Rectangle()
                .fill(Color.gray) // Adjust the color as needed
                .frame(height: 1)
            ZStack {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Charger-1, port 1")
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("CHAdeMo")
                            .font(.headline)
                        
                        HStack {
                            Image(systemName: "clock")
                            Text("S.R 125 /h")
                            
                            Image(systemName: "bolt.circle")
                            Text("50 kW")
                        }
                    }
                }
                .padding(.trailing, 100)
                HStack {
                    VStack {
                        Image(systemName: "ev.plug.dc.chademo")
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 30, height: 30)
                    }.padding(.vertical, -20)
                        .padding(.horizontal, 12)
                    Spacer()
                }
                
            }
            Rectangle()
                .fill(Color.gray) // Adjust the color as needed
                .frame(height: 1)
            ZStack {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Charger-1, port 2")
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("CCS-2")
                            .font(.headline)
                        
                        HStack {
                            Image(systemName: "clock")
                            Text("S.R 125 /h")
                            
                            Image(systemName: "bolt.circle")
                            Text("50 kW")
                        }
                    }
                }
                .padding(.trailing, 100)
                
                
                HStack {
                    VStack {
                        Image(systemName: "ev.plug.dc.ccs2")
                            .resizable()
                            .foregroundStyle(.black)
                            .frame(width: 30, height: 30)
                    }.padding(.vertical, -20)
                        .padding(.horizontal, 12)
                    Spacer()
                }
                
            }
            Rectangle()
                .fill(Color.gray) // Adjust the color as needed
                .frame(height: 1)
            Text("Photos")
                .bold()
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
           
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    card
                    card
                    card
                }
                .frame(height: 150)
                
            }
        }
        HStack(spacing: 0) {
            ZStack {
                Button(action: {
                    // Add action for the button here
                }) {
                    Text(" Scan code to proceed")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.cyan)
                        .cornerRadius(10)
                }
                
                Image(systemName: "qrcode.viewfinder")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .offset(x: -140)
            }
        }
        .padding(.horizontal, 10)

        }

    }
    
    
    var card: some View{
        HStack
        {
            VStack {
                Image("image1")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }

#Preview {
    CheckIn()
}
