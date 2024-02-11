//
//  File.swift
//  HALA
//
//  Created by 10M on 21/07/1445 AH.
//

import Foundation

struct Songs: Identifiable {
    var id: UUID = UUID()
    var name: String
    var artist: String
    var time: String
    var photo: String
}

struct Genre: Identifiable {
    var id: UUID = UUID()
    var title: String
    var phot: String
    
}

