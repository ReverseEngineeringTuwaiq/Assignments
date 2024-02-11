//
//  GenreViewModel.swift
//  HALA
//
//  Created by 10M on 21/07/1445 AH.
//

import SwiftUI


class GenreViewModel: ObservableObject{
    
    @Published var AllGenre: [Genre] = []
    @Published var TopGenre: [Genre] = []
    @Published var MidGenre: [Genre] = []
    @Published var LastGenre: [Genre] = []

    
    init(){
        addGenre()
    }
    
    func addGenre(){
        AllGenre = AllTheGenre
        TopGenre = upGen
        MidGenre = midGen
        LastGenre = downGen
        
    }
    
    
}

let AllTheGenre = [
    Genre(title: "Country", phot: "G1"),
    Genre(title: "Metal", phot: "G2"),
    Genre(title: "Jazz", phot: "G3"),
    Genre(title: "Hip-Hop", phot: "G4"),
    Genre(title: "Pop", phot: "G5"),
    Genre(title: "Idk", phot: "G6"),
    Genre(title: "Dj", phot: "G7"),
    Genre(title: "Spiritual", phot: "G8"),
    Genre(title: "Rock", phot: "G9")
    ]
    
    let upGen = [
        Genre(title: "Country", phot: "G1"),
        Genre(title: "Metal", phot: "G2"),
        Genre(title: "Jazz", phot: "G3")
    ]

let midGen = [
    
    Genre(title: "Hip-Hop", phot: "G4"),
    Genre(title: "Pop", phot: "G5"),
    Genre(title: "Idk", phot: "G6")

]


let downGen = [
    
    Genre(title: "Dj", phot: "G7"),
    Genre(title: "Spiritual", phot: "G8"),
    Genre(title: "Rock", phot: "G9")
]
