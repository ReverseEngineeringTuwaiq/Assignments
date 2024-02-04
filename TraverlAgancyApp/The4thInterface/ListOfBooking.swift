//
//  ListOfBooking.swift
//  TraverlAgancyApp
//
//  Created by Bushra Abuhaimed on 22/07/1445 AH.
//

import SwiftUI

struct BookingListArr: Identifiable{
    var id: UUID = UUID()
    var image: String
    var titel1: String
    var title2: String
}

var BB1: BookingListArr = BookingListArr(image: "cube.box.fill", titel1: "Package", title2: "Sajek Vally Travel")

var BB2: BookingListArr = BookingListArr(image: "person.3.fill", titel1: "Pasangers", title2: "2 Adults, 1 Child")

var BB3: BookingListArr = BookingListArr(image: "cablecar.fill", titel1: "Transport", title2: "Scania AC Bus(3 seats)")

var BB4: BookingListArr = BookingListArr(image: "building.fill", titel1: "Hotel & Resort", title2: "5 Star Hotel(Deluxe room")

var BB5: BookingListArr = BookingListArr(image: "calendar", titel1: "Date", title2: "18 Feb-22 Feb")

var AllBB: [BookingListArr] = [
    
    BB1,
    BB2,
    BB3,
    BB4,
    BB5
    
]

struct ListOfBooking: View {
    var body: some View {
        
        
            
            ForEach(AllBB, id: \.id){ i in
                
                
                   // HStack{
                        
                        ZStack{
                            
                            HStack{
                                
                           
                                ZStack{
                                    Rectangle()
                                        .frame(width: 40, height: 40, alignment: .leading)
                                        .foregroundColor(.white)
                                        .border(Color.gray)
                                        .cornerRadius(5)
                                        .offset(x:-90)
                                    
                                    
                                    
                                    Image(systemName: "\(i.image)")
                                        .frame(width: 40, height: 40)
                                        .offset(x:-90)
                                    
                                }
                                
                       
                                VStack(alignment:.leading){
                                    Text("\(i.titel1)")
                                        .font(.system(size: 15))
                                        .foregroundStyle(.gray)
                                        .offset(x:-90)
                                    
                                    
                                    Text("\(i.title2)")
                                        .font(.system(size: 15))
                                    //.padding(.trailing,25)
                                        .bold()
                                        .offset(x:-90)
                                }
                        }
                        }
                    }
                }
            }
            
       // }
    


#Preview {
    ListOfBooking()
}
