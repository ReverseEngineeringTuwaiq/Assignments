//
//  SongsViewModel.swift
//  HALA
//
//  Created by 10M on 21/07/1445 AH.
//

import Foundation


class SongsViewModel: ObservableObject{
    
    @Published var AllSongs: [Songs] = []
    
    init(){
        addSong()
    }
    
    func addSong(){
        AllSongs = AllTheSongs
    }
    
    
}

let AllTheSongs = [

    Songs(name: "Money Trees", artist: "Kendrick Lamar", time: "6:27", photo: "H1"),

    Songs(name: "Too many nights", artist: "Metro Booming", time: "3:20", photo: "H2"),

    Songs(name: "KMT", artist: "Drake", time: "2:43", photo: "H3"),

    Songs(name: "Dusk till dawn", artist: "Hala", time: "2:45", photo: "H4"),

    Songs(name: "The less i know the better", artist: "Tampe lmpala", time: "3:37", photo: "H5"),

    Songs(name: "With out me", artist: "Eminem", time: "4:58", photo: "H6"),

    Songs(name: "Redbone", artist: "Childish", time: "5:26", photo: "H7"),

    Songs(name: "Straight Out Compton", artist: "N.W.A", time: "4:20", photo: "H8"),

    Songs(name: "راجعين يا هوى", artist: "فيروز", time: "5:25", photo: "H9"),

    Songs(name: "الف ليلة وليلة", artist: "ام كلثوم", time: "41:32", photo: "H10"),

    Songs(name: "Maad city", artist: "Kendrick Lamar", time: "5:51", photo: "H11")
]
