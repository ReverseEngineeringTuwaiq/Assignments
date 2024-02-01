//
//  picsTest.swift
//  swiftAssignment
//
//  Created by Bushra Abuhaimed on 20/07/1445 AH.
//

import SwiftUI

// MARK: - PicsTest

struct Apartments1: Identifiable{
    var id: UUID = UUID()
    var name:String
    var image:String
}

struct PicsTest: View {
    var body: some View{
        
        var Pics:[Apartments1] = [Apartments1(name: "Modernica Apartment", image: "modern Apartment"),Apartments1(name: "Merica Apartment ", image: "modern2") , Apartments1(name: "Seritta Apartment ", image: "modern3")]
        
        
        
        
        
        
    }
}

#Preview {
    picsTest()
}
