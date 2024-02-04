//
//  ListOfBooking2.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct ListOfBooking2: View {
    var body: some View {
        
        
        HStack{
            
            ZStack{
//                Rectangle()
//                    .frame(width: 40, height: 40, alignment: .leading)
//                    .foregroundColor(.white)
//                    .border(Color.gray)
//                    .cornerRadius(5)
//                    .offset(x:-80)
                
                RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                            .frame(width: 40, height: 40, alignment:.leading)
                            .offset(x:-80)
                    
                
                Image(systemName: "cube.box.fill")
                    .frame(width: 40, height: 40)
                    .offset(x:-80)
            }
            
            HStack{
            
                VStack(alignment:.leading){
                    Text("Package")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                        .offset(x:-80)
                    
                    
                    Text("Sajek Vally Travel")
                        .font(.system(size: 15))
                    //.padding(.trailing,25)
                        .bold()
                       .offset(x:-80)
                }
            }
        }//.padding()
        
        
        HStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                            .frame(width: 40, height: 40, alignment:.leading)
                            .offset(x:-80)
                
                Image(systemName: "person.3.fill")
                    .frame(width: 40, height: 40)
                    .offset(x:-80)
            }
            
            HStack{
            
                VStack(alignment:.leading){
                    Text("Pasengers")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                        .offset(x:-80)
                    
                    
                    Text("2 Adults, 1 Child  ")
                        .font(.system(size: 15))
                    //.padding(.trailing,25)
                        .bold()
                       .offset(x:-80)
                }
            }
        }//.padding()
        
        HStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                            .frame(width: 40, height: 40, alignment:.leading)
                            .offset(x:-55)
                
                Image(systemName: "cablecar.fill")
                    .frame(width: 40, height: 40)
                    .offset(x:-55)
            }
            
            HStack{
            
                VStack(alignment:.leading){
                    Text("Transport")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                        .offset(x:-58)
                    
                    
                    Text("Scania AC Bus (3 seats)")
                        .font(.system(size: 15))
                    //.padding(.trailing,25)
                        .bold()
                       .offset(x:-58)
                }
            }
        }//.padding()
        
        HStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                            .frame(width: 40, height: 40, alignment:.leading)
                            .offset(x:-45)
                
                Image(systemName: "building.fill")
                    .frame(width: 40, height: 40)
                    .offset(x:-45)
            }
            
            
            HStack{
            
                VStack(alignment:.leading){
                    Text("Hotel & Resort")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                        .offset(x:-50)
                    
                    
                    Text("5 Star Hotel (Deluxe room)")
                        .font(.system(size: 15))
                    //.padding(.trailing,25)
                        .bold()
                       .offset(x:-50)
                }
            }
        }//.padding()
        
        HStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 1)
                            .frame(width: 40, height: 40, alignment:.leading)
                            .offset(x:-88)
                
                Image(systemName: "calendar")
                    .frame(width: 40, height: 40)
                    .offset(x:-88)
            }
            
            HStack{
            
                VStack(alignment:.leading){
                    Text("Date")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                        .offset(x:-90)
                    
                    
                    Text("18 Feb-22 Feb")
                        .font(.system(size: 15))
                    //.padding(.trailing,25)
                        .bold()
                       .offset(x:-90)
                }
            }
        }//.padding()
        
    }
}

#Preview {
    ListOfBooking2()
}
